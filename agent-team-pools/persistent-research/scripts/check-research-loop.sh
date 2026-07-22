#!/usr/bin/env bash
# Validate-only guard for Persistent Research Kit (pool pack 0.3).
# Never calls models. Never starts research. Prints next legal action only.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CHARTER=""
POOL_ROOT=""
STRICT_ENV=1
BRAIN_PROMPT="${KIT_ROOT}/PERSISTENT-RESEARCH-BRAIN.md"

usage() {
  cat <<'EOF'
Usage: check-research-loop.sh --charter <RESEARCH-CHARTER.md> [--pool-root <dir>] [--strict-env|--no-strict-env]

  Validates charter + pause + grounding env. Prints next legal action.
  Exit 0 = PASS
  Exit 2 = usage error
  Exit 3 = PAUSE present
  Exit 1 = other validation failure

Never invokes LLMs / OpenRouter / dash agent providers.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --charter) CHARTER="${2:-}"; shift 2 ;;
    --pool-root) POOL_ROOT="${2:-}"; shift 2 ;;
    --strict-env) STRICT_ENV=1; shift ;;
    --no-strict-env) STRICT_ENV=0; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown arg: $1" >&2; usage; exit 2 ;;
  esac
done

if [[ -z "${CHARTER}" ]]; then
  echo "ERROR: --charter is required" >&2
  usage
  exit 2
fi

if [[ ! -f "${CHARTER}" ]]; then
  echo "ERROR: charter not found: ${CHARTER}" >&2
  exit 1
fi

CHARTER_DIR="$(cd "$(dirname "${CHARTER}")" && pwd)"
if [[ -z "${POOL_ROOT}" ]]; then
  POOL_ROOT="${CHARTER_DIR}"
fi
POOL_ROOT="$(cd "${POOL_ROOT}" && pwd)"

fail=0
paused=0

echo "==> Persistent Research check"
echo "    charter: ${CHARTER}"
echo "    pool:    ${POOL_ROOT}"
echo "    kit:     ${KIT_ROOT}"

if [[ -e "${CHARTER_DIR}/PAUSE" || -e "${POOL_ROOT}/PAUSE" ]]; then
  echo "FAIL: PAUSE file present — research loop paused" >&2
  paused=1
  fail=1
fi

# Prefer **Current status:** `…` ; fall back to **Status:** `…` with a single token
STATUS=""
if grep -qE '^\*\*Current status:\*\*' "${CHARTER}"; then
  STATUS="$(grep -E '^\*\*Current status:\*\*' "${CHARTER}" | head -1 | sed -n 's/.*`\([^`]*\)`.*/\1/p')"
  if [[ -z "${STATUS}" ]]; then
    STATUS="$(grep -E '^\*\*Current status:\*\*' "${CHARTER}" | head -1 | sed -E 's/^\*\*Current status:\*\*[[:space:]]*//;s/[[:space:]]+$//')"
  fi
elif grep -qE '^\*\*Status:\*\*' "${CHARTER}"; then
  STATUS_LINE="$(grep -E '^\*\*Status:\*\*' "${CHARTER}" | head -1)"
  BT_COUNT="$(printf '%s' "${STATUS_LINE}" | tr -cd '`' | wc -c | tr -d ' ')"
  if [[ "${BT_COUNT}" -eq 2 ]]; then
    STATUS="$(printf '%s' "${STATUS_LINE}" | sed -n 's/.*`\([^`]*\)`.*/\1/p')"
  fi
fi

case "${STATUS}" in
  admin-locked|active)
    echo "OK status: ${STATUS}"
    ;;
  paused)
    echo "FAIL: charter Current status is paused" >&2
    fail=1
    ;;
  draft)
    echo "FAIL: charter still draft — Admin must lock (admin-locked) then start (active)" >&2
    fail=1
    ;;
  *)
    echo "FAIL: need **Current status:** \`admin-locked\` or \`active\` (got: '${STATUS:-unset}')" >&2
    fail=1
    ;;
esac

if [[ ! -f "${POOL_ROOT}/HIGHLIGHTS.md" ]]; then
  echo "WARN: missing ${POOL_ROOT}/HIGHLIGHTS.md"
fi

if [[ ! -f "${POOL_ROOT}/RUN-LOG.md" && ! -f "${CHARTER_DIR}/RUN-LOG.md" ]]; then
  echo "WARN: RUN-LOG.md not found — create from RUN-LOG.md.template before sessions"
fi

if [[ "${STRICT_ENV}" -eq 1 ]]; then
  bad_env=0
  if [[ -n "${UVRN_DASH_AI_KEY:-}" || -n "${OPENROUTER_API_KEY:-}" || -n "${OPENROUTER_KEY:-}" ]]; then
    echo "FAIL: OpenRouter / UVRN_DASH_AI_KEY is set — use Cursor search for routine research" >&2
    bad_env=1
  fi
  if [[ "${DASH_PROVIDER:-}" == "agent" || "${DASH2_PROVIDER:-}" == "agent" ]]; then
    echo "FAIL: DASH*_PROVIDER=agent — fixture-only for local Brain loops" >&2
    bad_env=1
  fi
  if [[ "${DASH_AGENT_ENABLED:-}" == "true" ]]; then
    echo "FAIL: DASH_AGENT_ENABLED=true — not for routine Persistent Research" >&2
    bad_env=1
  fi
  if [[ "${bad_env}" -eq 1 ]]; then
    fail=1
  else
    echo "OK env: no agent/OpenRouter keys detected (strict)"
  fi
else
  echo "WARN: --no-strict-env (env check skipped)"
fi

if [[ ! -f "${BRAIN_PROMPT}" ]]; then
  echo "FAIL: Brain prompt missing at ${BRAIN_PROMPT}" >&2
  fail=1
fi

if [[ "${paused}" -eq 1 ]]; then
  echo "==> PAUSED — Admin: remove PAUSE, then start research loop"
  exit 3
fi

if [[ "${fail}" -ne 0 ]]; then
  echo "==> FAIL CLOSED — do not start Brain session" >&2
  exit 1
fi

echo "==> PASS"
echo "Next legal action:"
echo "  1. If status is admin-locked only, Admin: start research loop → active."
echo "  2. Paste prompt: ${BRAIN_PROMPT}"
echo "  3. Fill placeholders from: ${CHARTER}"
echo "  4. Write insight only; append RUN-LOG; stop at max iterations."
exit 0
