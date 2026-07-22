# Scaffold — copy me for a new product build-master

**patternVersion:** `0.5.1`  
**Source:** `hive/master-build/scaffold/`  
**Doctrine:** [`../MASTER-BUILD-PATTERN.md`](../MASTER-BUILD-PATTERN.md)

## Adopt steps

1. Copy this entire folder to e.g. `<executive>/<product>_build-master/`.
2. Rename every `*.template` file (drop `.template`).
3. **Either** replace `⟨placeholders⟩` by hand **or** run Seed-from-idea (`04-agent-ops/PROGRAM-SEED.md` + `SEED-AGENT-PROMPT.md`) from an Admin idea.
4. Admin **program lock** (`00-MASTER-PLAN.md` status → `admin-locked` / `active`).
5. Set **CP-0 mode** in MASTER-PLAN adapter (`admin-gated` default; see `04-agent-ops/CP0-POLICY.md`).
6. Complete remaining product adapter slots (`workLogsRoot`, `historyRoot`, hard walls, recommended slots).
7. Register in [`../INSTANCES.md`](../INSTANCES.md) with `patternVersion: 0.5.1`.

## Folder map (after rename)

| Path | Required? |
|---|---|
| `COMPOSER.md` | Required (system guide) |
| `AGENTS.md` | Required (agent team map) |
| `00-MASTER-PLAN.md` | Required |
| `WORKSTREAMS.md` | Required |
| `01-blueprints/` + ledger | Required |
| `03-audit/` | Required |
| `04-agent-ops/COORDINATION.md` | Required |
| `04-agent-ops/PROGRAM-SEED.md` | Required (greenfield) |
| `04-agent-ops/SEED-GUIDANCE.md` | Required (greenfield) |
| `04-agent-ops/CP0-POLICY.md` | Required |
| `04-agent-ops/PUBLISHER.md` | Required |
| `04-agent-ops/CLOSEOUT.md` | Required |
| `04-agent-ops/LOCAL-SAFE-DEFAULTS.md` | Required |
| `04-agent-ops/` prompts + UNIT PREP/READY/HANDOFF | Required |
| `04-agent-ops/UNIT-work-log*.template` | Required templates (rename per unit / copy to workLogsRoot on CLOSEOUT) |
| Product `workLogsRoot` (outside or beside this tree) | Required durable SoR |
| `05-history/` or product `historyRoot` | Required linked archive map + per-unit CLOSEOUT entries |
| `02-contracts/` | Recommended |
| `design-handoff/` | Recommended |
| `04-agent-ops/UI-CATALOG-SLOT.md` | Recommended (Required if product opts in) |

## Cold-start

See parent [`../README.md`](../README.md) CHARTER — start at this instance’s `COMPOSER.md` → `AGENTS.md`. After merge: `04-agent-ops/CLOSEOUT.md`.
