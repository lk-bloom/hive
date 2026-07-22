#!/usr/bin/env bash
# Dual-publish guard for lk-bloom/hive (public tip).
# Default: dry-run. Use --apply to rsync a scrubbed candidate into a target clone.
# Never force-pushes. Fail closed on OPSEC deny patterns.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HIVE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
APPLY=0
TARGET=""
KEEP_STAGING=0

usage() {
  cat <<'EOF'
Usage: publish-public-tip.sh [--dry-run] [--apply --target <path-to-lk-bloom-hive-clone>] [--keep-staging]

  --dry-run     Stage + scan only (default). Exit 0 if clean.
  --apply       After a clean scan, rsync candidate into --target (must be a git checkout of lk-bloom/hive).
  --target DIR  Destination clone root (required with --apply).
  --keep-staging  Leave the staging dir (prints path). Default: delete after run.

Excludes: registry/private/**, .claude/, .DS_Store, .git
Denies (content scan on staged tree, including hidden files): absolute /Users/ paths
  (except PUBLICATION deny-list wording), LIVE-BUILD-INSTANCES, LIVE-POOL-INSTANCES,
  LIVE-HIVE-MAP, registry/private presence, common secret filenames.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) APPLY=0; shift ;;
    --apply) APPLY=1; shift ;;
    --target) TARGET="${2:-}"; shift 2 ;;
    --keep-staging) KEEP_STAGING=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown arg: $1" >&2; usage; exit 2 ;;
  esac
done

if [[ "${APPLY}" -eq 1 && -z "${TARGET}" ]]; then
  echo "ERROR: --apply requires --target <clone>" >&2
  exit 2
fi

STAGING="$(mktemp -d "${TMPDIR:-/tmp}/hive-public-tip.XXXXXX")"
cleanup() {
  if [[ "${KEEP_STAGING}" -eq 0 ]]; then
    rm -rf "${STAGING}"
  else
    echo "Staging kept: ${STAGING}"
  fi
}
trap cleanup EXIT

echo "==> Staging from ${HIVE_ROOT}"
# rsync exclude private live registries, local agent configs, and junk
rsync -a \
  --exclude '.git/' \
  --exclude '.claude/' \
  --exclude '.DS_Store' \
  --exclude 'registry/private/' \
  --exclude 'registry/private' \
  "${HIVE_ROOT}/" "${STAGING}/"

fail=0

echo "==> Structural checks"
if [[ -d "${STAGING}/registry/private" ]]; then
  echo "FAIL: staging still contains registry/private/" >&2
  fail=1
fi
if [[ -d "${STAGING}/.claude" ]]; then
  echo "FAIL: staging still contains .claude/" >&2
  fail=1
fi
if find "${STAGING}" -type f \( -name '.env' -o -name '.env.*' -o -name '*.pem' -o -name 'credentials.json' \) 2>/dev/null | grep -q .; then
  echo "FAIL: secret-like filenames in staging" >&2
  find "${STAGING}" -type f \( -name '.env' -o -name '.env.*' -o -name '*.pem' -o -name 'credentials.json' \) 2>/dev/null >&2 || true
  fail=1
fi

echo "==> Content deny scan"
# Real home paths (/Users/<name>/...), not deny-list ellipsis `/Users/...`
# Scan hidden files too — local agent configs must not slip through.
PATH_RE='/Users/[A-Za-z0-9_]'
if command -v rg >/dev/null 2>&1; then
  PATH_HITS="$(rg --hidden -n "${PATH_RE}" "${STAGING}" || true)"
  if [[ -n "${PATH_HITS}" ]]; then
    echo "FAIL: absolute /Users/<name> path content in publish candidate" >&2
    echo "${PATH_HITS}" >&2
    fail=1
  fi
  # Policy docs may name LIVE-* paths as "not published" pointers.
  # Fail only when those files exist in the staged tree (below).
else
  echo "WARN: rg not found; using grep fallback" >&2
  if grep -RInE "${PATH_RE}" "${STAGING}" >/dev/null 2>&1; then
    echo "FAIL: absolute /Users/<name> path content" >&2
    grep -RInE "${PATH_RE}" "${STAGING}" >&2 || true
    fail=1
  fi
fi

# Fail if live registry filenames exist as files (after exclude — leak if present)
if find "${STAGING}" -type f \( \
    -name 'LIVE-BUILD-INSTANCES.md' -o \
    -name 'LIVE-POOL-INSTANCES.md' -o \
    -name 'LIVE-HIVE-MAP.md' \
  \) | grep -q .; then
  echo "FAIL: LIVE-* registry files present in staging" >&2
  find "${STAGING}" -type f \( \
    -name 'LIVE-BUILD-INSTANCES.md' -o \
    -name 'LIVE-POOL-INSTANCES.md' -o \
    -name 'LIVE-HIVE-MAP.md' \
  \) >&2 || true
  fail=1
fi

if [[ "${fail}" -ne 0 ]]; then
  echo "==> FAIL CLOSED — not publishing" >&2
  exit 1
fi

echo "==> Scan PASS (candidate clean)"
echo "    files: $(find "${STAGING}" -type f | wc -l | tr -d ' ')"

if [[ "${APPLY}" -eq 0 ]]; then
  echo "==> Dry-run only. Re-run with: $0 --apply --target /path/to/lk-bloom-hive-clone"
  exit 0
fi

if [[ ! -d "${TARGET}/.git" ]]; then
  echo "ERROR: --target must be a git checkout (missing .git): ${TARGET}" >&2
  exit 2
fi

# Soft check: remote looks like lk-bloom/hive (warn only)
if command -v git >/dev/null 2>&1; then
  REMOTE="$(git -C "${TARGET}" remote get-url origin 2>/dev/null || true)"
  if [[ -n "${REMOTE}" && "${REMOTE}" != *lk-bloom/hive* ]]; then
    echo "WARN: target origin does not look like lk-bloom/hive: ${REMOTE}" >&2
  fi
fi

echo "==> Applying rsync → ${TARGET}"
rsync -a --delete \
  --exclude '.git/' \
  --exclude '.claude/' \
  --exclude '.DS_Store' \
  --exclude 'registry/private/' \
  "${STAGING}/" "${TARGET}/"

echo "==> Apply complete (working tree updated; commit/push separately — no force-push from this script)"
exit 0
