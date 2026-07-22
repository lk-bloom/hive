# Publication policy — public vs private

**Public tip:** [github.com/lk-bloom/hive](https://github.com/lk-bloom/hive)

## Always publishable

- `ORCHESTRATION.md`, `HIVE-ROADMAP.md`, `GLOSSARY.md`, `CONTRIBUTING.md`, `LICENSE`, this file
- Pattern doctrine + scaffolds (`master-build/`, `agent-team-pools/`)
- Doctrine ADRs (house style)
- Distill / proposals templates
- Smoke instances (docs-only)
- `scripts/publish-public-tip.sh` (publish guard)

## Never publish

- Absolute machine paths (`/Users/...`)
- Live product INSTANCES rows (private repos, tip SHAs, CP-0 status, absolute checkouts)
- Live HIVE-MAP product pins with private detail
- Secrets, keys, tokens, `.env`, PEM
- `registry/private/**` (Admin machine only)

## Contributor rules

Before filing a proposal or syncing the public tip:

1. Do **not** add `registry/private/**` to any public publish candidate.
2. Do **not** commit absolute machine paths, live INSTANCES rows, tip SHAs, or secrets.
3. File doctrine upgrades via [`proposals/`](./proposals/); Steward accepts — contributors do not self-merge.
4. Run the publish guard (below) before any public push.

## Dual publish

Private mirror (`lyrikai-os/lk-bloom`) may keep live registries under `hive/registry/private/`.  
Public `lk-bloom/hive` must not include that folder. Scrub before every public push; rewrite history if a leak lands on the public tip.

### Publish checklist

1. Edit on the private parent (`lyrikai-os/lk-bloom` → `hive/`).
2. Run [`scripts/publish-public-tip.sh`](./scripts/publish-public-tip.sh) (dry-run default) — **fail closed** on deny patterns.
3. Only with Steward/Admin OK: re-run with `--apply` against a clean `lk-bloom/hive` clone, then push that tip normally (no force-push unless Admin explicitly orders a history rewrite).
4. Re-scan the public tip tree after push.

Guard script: [`scripts/publish-public-tip.sh`](./scripts/publish-public-tip.sh).
