# Technical worklog — Persistent Research Kit 0.3 (public tip)

**Repo:** [lk-bloom/hive](https://github.com/lk-bloom/hive)  
**Branch:** `hive/persistent-research-kit-0.3` → merged `main`  
**Merge:** `2e79c38` (PR head `b6f1064`, base `ef22c7a`)

## Technical context

Public tip was pattern/doctrine only at pool **0.2** after OPSEC scrub. Unit adds opt-in recurrence kit and bumps pack to **0.3**.

## Changes made

| Area | What |
|---|---|
| `agent-team-pools/persistent-research/` | README, HOW-TO, charter template, Brain prompt, RUN-LOG/PAUSE, `check-research-loop.sh` |
| `POOL-PATTERN.md` / pack README / INSTANCES | Version **0.3**, §3a kit, smoke row |
| Scaffold / ORCHESTRATION / GLOSSARY / root README | Pointers + version line |
| `instances/smoke-persistent-research/` | Docs-only filled charter + stubs |

## Architectural reasoning

- Keep insight altitude (pools) separate from MBP CP-0/worktrees.
- Fail-closed validate script prevents silent OpenRouter / agent-provider local runs.
- Smoke proves surfaces without product path leakage.

## Key surfaces

- Charter: `**Current status:** \`admin-locked\`|\`active\``
- Pause: file named `PAUSE` → script exit 3
- Brain modes: ingest · query · lint within max iterations

## Structural impact

Pool pack tip **0.2 → 0.3**. Legacy `smoke-docs-only` remains **0.2**. No product WORKSTREAMS changes.

## Build / test / deploy

- `check-research-loop.sh` PASS on smoke; PAUSE and `DASH2_PROVIDER=agent` fail closed
- `publish-public-tip.sh --dry-run` PASS before public apply
- Public tip deployed via merge of [PR #1](https://github.com/lk-bloom/hive/pull/1)

## Pending technical work

- Land same patch on `lyrikai-os/lk-bloom` main (PR still open)
- Refresh private LIVE-HIVE-MAP pool tip note to 0.3 when Admin upgrades
