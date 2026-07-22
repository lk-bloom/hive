# 00 · MASTER PLAN — Master Build Pattern smoke (docs-only)

**patternVersion:** `0.2`  
**Product slug:** `mbp-smoke`  
**Owner:** Shawn Suttle  
**Build target:** docs-only (no app code)  
**Site / primary checkout:** `lk-bloom` (repo root of this tree)  
**Repo:** local `lk-bloom` (smoke)  
**workLogsRoot:** `master-build/instances/smoke-docs-only/work-logs`

Locked definition for the scaffold smoke instance — proves scaffold adopt + CLOSEOUT/worklogs without reading another product’s build-master.

---

## 1 · What this product is

A disposable **docs-only** instance that validates copying `master-build/scaffold/`, renaming templates, filling the product adapter, and hosting a local `workLogsRoot` for CLOSEOUT smoke.

---

## 2 · Locked decisions

| ID | Decision | Date |
|---|---|---|
| D1 | Docs-only; Admin may waive sandbox preview and tech worklog for ledger/docs units | 2026-07-15 |
| D2 | No UI-catalog opt-in | 2026-07-15 |
| D3 | Contracts + design-handoff remain N/A for smoke | 2026-07-15 |
| D4 | patternVersion 0.2 — CLOSEOUT + dual worklogs Required (stubs OK) | 2026-07-15 |

---

## 3 · Product adapter (Required vs Recommended)

### Required (pattern)

| Slot | Instance fill |
|---|---|
| Independent audit | Always |
| Human sandbox preview before PR | Admin: human · docs-only waiver: allowed in writing on HANDOFF |
| One unit / one worktree / one PR | Worktree prefix: `../wt-mbp-smoke-` · branch: `mbp-smoke/…` |
| Primary checkout on `main` | Path: `lk-bloom` (repo root) |
| Append-only ledger + PREP→READY→HANDOFF | Under this instance |
| Local safe defaults | No live APIs; no secrets |
| Publisher checklist | `04-agent-ops/PUBLISHER.md` |
| Post-merge CLOSEOUT | `04-agent-ops/CLOSEOUT.md` |
| Dual worklogs | Finalize under **workLogsRoot** (above) |
| Next pointer / do-not-start | No CP-0 until Admin unlock |

### Recommended

| Slot | This product | Paths / notes |
|---|---|---|
| UI / chrome catalog | N/A | No UI |
| `02-contracts/` | N/A | Shape proof only |
| `design-handoff/` | N/A | Placeholder only |
| Architecture / OOP tip stamp | N/A | |

---

## 4 · Hard walls (product-specific)

- Do not import or depend on another product’s build-master for operating rules.  
- Do not add application source code under this smoke instance.

---

## 5 · Env + commands (sketch)

| Concern | Command / note |
|---|---|
| Dev | N/A (docs) |
| Test | Presence of CLOSEOUT.md + work-logs stubs |

---

## 6 · Definition of done (program)

Instance at `0.2`; CLOSEOUT mirrored; workLogsRoot stubs indexed; cold-start works without another product’s build-master.
