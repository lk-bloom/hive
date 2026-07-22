# Persistent Research Kit (opt-in)

**poolPatternVersion:** `0.3` (introduced)  
**Parent pack:** [`../POOL-PATTERN.md`](../POOL-PATTERN.md)  
**Hive cold-start:** [`../../ORCHESTRATION.md`](../../ORCHESTRATION.md)

Optional recurrence **discipline** for Research Brains — not a daemon, not CP-0, not a model runner.

## What this is

Safe, Admin-gated loops so a Brain can run recurring insight sessions with:

- A filled **research charter** (bounds, budgets, pause)
- A paste-ready **Brain prompt** (ingest / query / lint modes)
- An append-only **RUN-LOG**
- A **validate-only** script (`check-research-loop.sh`)

Insight writes stay on existing pool surfaces: `HIGHLIGHTS` · `DIGESTS` · `PROPOSALS` · instance `INBOX`.

## Start here

1. Admin: [`HOW-TO-PERSISTENT-RESEARCH.md`](./HOW-TO-PERSISTENT-RESEARCH.md)
2. Fill [`RESEARCH-CHARTER.md.template`](./RESEARCH-CHARTER.md.template) in the product pool
3. Validate: [`scripts/check-research-loop.sh`](./scripts/check-research-loop.sh)
4. Agent: paste [`PERSISTENT-RESEARCH-BRAIN.md`](./PERSISTENT-RESEARCH-BRAIN.md)

## Layout

| Path | Role |
|---|---|
| [`HOW-TO-PERSISTENT-RESEARCH.md`](./HOW-TO-PERSISTENT-RESEARCH.md) | Admin enablement |
| [`PERSISTENT-RESEARCH-BRAIN.md`](./PERSISTENT-RESEARCH-BRAIN.md) | Agent prompt template |
| [`RESEARCH-CHARTER.md.template`](./RESEARCH-CHARTER.md.template) | Charter fields |
| [`RUN-LOG.md.template`](./RUN-LOG.md.template) | Append-only session log |
| [`PAUSE.example`](./PAUSE.example) | Presence of `PAUSE` = loop paused |
| [`scripts/check-research-loop.sh`](./scripts/check-research-loop.sh) | Validate only (never calls models) |

## Smoke

Docs-only: [`../instances/smoke-persistent-research/`](../instances/smoke-persistent-research/)

## Red lines

- No OpenRouter / product AI keys for routine runs — Cursor search tools
- No WORKSTREAMS writes; Admin promote only
- No CP-0 to “start research” — use charter lock + Admin phrases
- External cron/GHA may *invoke an agent session*; Hive never embeds a scheduler or LLM caller
