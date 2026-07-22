# Scaffold — copy me for a new product agent-team-pool instance

**poolPatternVersion:** `0.2`  
**Source:** `hive/agent-team-pools/scaffold/`  
**Companion:** Master Build Pattern `0.5.1`  
**Doctrine:** [`../POOL-PATTERN.md`](../POOL-PATTERN.md)

## Adopt steps

1. Copy this entire folder to e.g. `<executive>/<product>-master-dev-bot-pool/`.
2. Rename every root `*.template` file (drop `.template`).
3. For each domain pool: copy `pools/_POOL.template/` → `pools/<pool-id>/`, then rename templates inside that folder.
4. Paste **Master Pool Lead** (`MASTER-POOL-LEAD-PROMPT.md`) with Admin path map — **or** fill placeholders by hand.
5. Admin **pool lock** (`REGISTRY.md` / `COMPOSER.md` status → `admin-locked` / `active`).
6. Register in [`../INSTANCES.md`](../INSTANCES.md) with `poolPatternVersion` matching the pack tip.
7. Optional: pointer from product build-master / site AGENTS → this instance.
8. Admin promote path: [`../PROMOTE-TO-WORKSTREAMS.md`](../PROMOTE-TO-WORKSTREAMS.md).

## Folder map (after rename)

| Path | Required? |
|---|---|
| `COMPOSER.md` | Required |
| `AGENTS.md` | Required |
| `REGISTRY.md` | Required |
| `INBOX.md` | Required |
| `MASTER-POOL-LEAD-PROMPT.md` | Required (greenfield) |
| `pools/<pool-id>/README.md` | Required per pool |
| `pools/<pool-id>/HIGHLIGHTS.md` | Required per pool |
| `pools/<pool-id>/PROPOSALS.md` | Required per pool |
| `pools/<pool-id>/BRAIN-PROMPT.md` | Required per pool |
| `pools/<pool-id>/TEAMS.md` | Required per pool |
| `pools/<pool-id>/DIGESTS/` | Optional (Horizon 2 Brain digests) |

Keep `pools/_POOL.template/` in the scaffold only (source blueprint). Instances may delete the `_POOL.template` folder after copying real pools.

## Cold-start

See [`../../ORCHESTRATION.md`](../../ORCHESTRATION.md), then parent [`../README.md`](../README.md) — start at instance `COMPOSER.md` → `AGENTS.md` → `REGISTRY.md`.
