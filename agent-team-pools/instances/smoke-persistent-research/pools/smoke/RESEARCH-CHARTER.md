# Research Charter — smoke (Persistent Research Kit smoke)

**Allowed statuses:** `draft` · `admin-locked` · `active` · `paused`  
**Current status:** `admin-locked`  
**poolPatternVersion kit:** `0.3`  
**Pause file:** `PAUSE` in this directory (presence = refuse new sessions)

> Docs-only smoke. Not CP-0.

---

## Identity

| Field | Value |
|---|---|
| Product | Persistent Research Kit smoke |
| Pool id | smoke |
| Instance root | `hive/agent-team-pools/instances/smoke-persistent-research` |
| Pool folder | `pools/smoke` |
| Charter owner (Admin) | smoke Admin |

## Research questions

1. Does `check-research-loop.sh` PASS on an admin-locked docs charter?
2. Does PAUSE fail closed?
3. Are insight write surfaces named without inventing a job board?

## Three layers

| Layer | Location | Rule |
|---|---|---|
| **Raw sources** | Kit HOW-TO + POOL-PATTERN §3a | Read-only |
| **Compiled insight** | This pool HIGHLIGHTS / DIGESTS / PROPOSALS | Insight only |
| **Schema** | This charter + hive `PERSISTENT-RESEARCH-BRAIN.md` | Admin-owned |

## Allowed paths

- `hive/agent-team-pools/persistent-research/`
- `hive/agent-team-pools/instances/smoke-persistent-research/`

## Do not touch

- Live UVRN / private registries
- Feature code / worktrees / WORKSTREAMS
- Secrets and AI provider keys

## Cadence

| Mode | Suggestion |
|---|---|
| Human | Admin runs validate + optional Brain paste for docs smoke |
| External | Not used in smoke |

**Max iterations per session:** `1`  
**Soft budget notes:** docs-only; no model spend

## Optional surfaces

| Surface | Enabled? | Path |
|---|---|---|
| Dated DIGESTS | yes | `DIGESTS/` |
| Optional pool `wiki/` | no | — |
| `RESEARCH-INDEX.md` | no | — |
| `RUN-LOG.md` | yes | `RUN-LOG.md` |

## Session modes allowed

- [x] ingest
- [x] query
- [x] lint

## Grounding

- Cursor search tools only
- Never OpenRouter / dash agent providers for this loop
