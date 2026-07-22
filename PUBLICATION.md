# Publication policy — public vs private

**Public tip:** [github.com/lk-bloom/hive](https://github.com/lk-bloom/hive)

## Always publishable

- `ORCHESTRATION.md`, `HIVE-ROADMAP.md`, this file
- Pattern doctrine + scaffolds (`master-build/`, `agent-team-pools/`)
- Doctrine ADRs (house style)
- Distill / proposals templates
- Smoke instances (docs-only)

## Never publish

- Absolute machine paths (`/Users/...`)
- Live product INSTANCES rows (private repos, tip SHAs, CP-0 status, absolute checkouts)
- Live HIVE-MAP product pins with private detail
- Secrets, keys, tokens, `.env`, PEM
- `registry/private/**` (Admin machine only)

## Dual publish

Private mirror (`lyrikai-os/lk-bloom`) may keep live registries under `hive/registry/private/`.  
Public `lk-bloom/hive` must not include that folder. Scrub before every public push; rewrite history if a leak lands on the public tip.
