# Master Build Pattern — v0.5.1

**Version:** `0.5.1`  
**Status:** active  
**Date:** 2026-07-22  
**Owner:** Suttle Media LLC  
**Audience:** humans + agents (all agentic build teams)  
**Canonical home:** `hive/master-build/` (clone of [lk-bloom/hive](https://github.com/lk-bloom/hive); or nested under a private `lk-bloom` checkout as `lk-bloom/hive/master-build/`)

This is the **operational build pattern** for multi-agent product work: Seed-from-idea, roles, unit loop, hard gates, post-merge CLOSEOUT, CP-0 policy, and a copyable scaffold. It expresses Bloom Protocol governance at ground level without forking it.

**Changelog `0.5` → `0.5.1`:** Docs clarification — mandatory **bee roster** at Seed (`AGENTS.md`); master **local project boundary** (cross-hive share only with human Admin gate); Executive-ops / Design bees named; Admin-as-agent mode remains parked. No new lifecycle gate.

**Changelog `0.4.1` → `0.5`:** Required CLOSEOUT **Brain digest** when a product agent-team-pool instance exists (template `04-agent-ops/BRAIN-DIGEST.md.template` → pool `DIGESTS/` / HIGHLIGHTS pointer). Insight only — not a job board. Instances without a pool record honest deferral. Minor release; live instances re-pin deliberately.

**Changelog `0.4` → `0.4.1`:** Concurrent CLOSEOUT safety clarification: one atomic build-master lease for shared finalization, durable ownership row in COORDINATION, re-read-after-claim, merge-SHA ancestry verification against current `origin/main`, owned-worktree-only cleanup, separate recording of unit merge SHA vs synchronized main tip, and branch-interval reconciliation so same-branch multi-agent contributions cannot disappear between handoffs and land.

**Changelog `0.3` → `0.4`:** Required CLOSEOUT evidence inside the existing post-merge gate: product-adapted `historyRoot`, one linked history entry per landed unit, codeframe + plan-divergence + anomaly capture, product-local doctrine-impact review, and verified primary-main synchronization with honest blocked outcomes. This is a minor closeout-step expansion, not a new lifecycle gate; instances re-pin deliberately.

**Changelog `0.2` → `0.3`:** Seed-from-idea phase (draft MASTER-PLAN + WORKSTREAMS + first BP + COMPOSER/AGENTS → Admin **program lock**); `COMPOSER.md` / `AGENTS.md` system guides; `SEED-GUIDANCE.md` ask-vs-draft policy; `CP0-POLICY.md` — default `admin-gated` per-unit unlock, optional `automation-eligible` in-domain auto CP-0 when circumstance checks PASS. Does not ship an automation daemon.

**Changelog `0.1` → `0.2`:** Required post-merge CLOSEOUT recipe; `workLogsRoot` product adapter; dual overview+tech worklogs Required inside CLOSEOUT.

---

## Red lines (do not cross)

1. **Do not fork `BLOOM-PROTOCOL.md`.** Cite the suite; do not copy and drift. Canonical SOP: `dispatch/agent-doc-master/governance/bloom-protocol/BLOOM-PROTOCOL.md` (v1.7).
2. **Do not author Decided architectural-spec content into Open sections** of `lk-bloom/spec/lk-bloom_spec-1/`. Charter-level framing only until a section is Decided.
3. **Do not blend altitudes.** Identify SOP vs architectural pattern vs cycle object before applying rules. See gist `00` + `04`.
4. **Do not duplicate this doctrine into the dispatch pointer file.** Dispatch holds a thin pointer only.
5. **Do not CP-0 before Admin program lock** after Seed (program status must be `admin-locked` or `active`).
6. **Do not auto-CP-0 unless** product adapter CP-0 mode is `automation-eligible` **and** all circumstance checks in `04-agent-ops/CP0-POLICY.md` PASS. Default remains `admin-gated` (park with “do not start” until Admin unlocks).
7. **Auto-CP-0 never** expands hard walls, skips audit, or skips preview (unless an existing documented waiver class applies).
8. **Do not turn CLOSEOUT history into a second queue.** WORKSTREAMS stays live status; the ledger stays lifecycle evidence; worklogs stay the detailed record; `historyRoot` is the linked historical map.
9. **Do not race CLOSEOUT writers.** Unit-specific worklog drafting may run in parallel, but shared SoR/history/main-sync finalization requires the build-master CLOSEOUT lease. Never clear another agent’s lease or prune another unit’s worktree.
10. **Do not equate branch ownership with change ownership.** On a same-branch multi-agent unit, CLOSEOUT must reconcile PR metadata, the recorded branch interval, the landed delta, worktree state, and every agent handoff. Unmapped commits/files or dropped/piggybacked changes are gaps, not silently attributed work.
11. **Do not leave Seed without a bee roster.** Instance `AGENTS.md` must name bees (Executive-ops, Design, Brain, Build, Audit, …) and assigned local paths before program lock. See `lk-bloom/hive/ORCHESTRATION.md` §6.
12. **Do not work outside the assigned local project** or share files with other hive-network products without **human Admin gated approval**. Cite-by-path reads of `lk-bloom/hive/` doctrine are always allowed. See `ORCHESTRATION.md` §0a.

---

## Version / change-control

| Rule | Detail |
|---|---|
| Pin | Instances record `patternVersion` (e.g. `0.4`) in [`INSTANCES.md`](./INSTANCES.md) |
| Patch `0.4.x` | Clarify templates / safe mechanics inside existing gates; no new lifecycle gate |
| Minor `0.x` | New recommended slots or publisher/closeout/seed steps; existing instances may stay pinned |
| Major `x.0` | Required-gate change; instances must re-ack or stay on old pin until upgraded |
| Live instances | Do **not** silently rewrite registered live instances to match scaffold churn — pin and upgrade deliberately |

Breaking change = bump doctrine header + note in `INSTANCES.md`.

---

## 1 · Purpose

One pattern so every agentic team shares:

- the same **Seed-from-idea** path (program surfaces from an Admin idea → Admin program lock)  
- the same roles and handoffs  
- the same unit loop (Bloom §2 mapped to worktrees / audit / preview / PR)  
- the same required gates  
- the same **CP-0 policy** surface (admin-gated vs automation-eligible)  
- the same **post-merge CLOSEOUT** (SoR reflect + dual worklogs + linked history + verified housekeeping + next pointer)  
- a fill-in scaffold that does not require reading another product’s build-master rules  

Product law (hard walls, honesty vocabulary, provider names, `workLogsRoot`, `historyRoot`, CP-0 mode, domain bounds) lives in each instance’s `00-MASTER-PLAN.md` **product adapter** — not here.

---

## 2 · Altitude map

| Altitude | What | Role relative to this pattern |
|---|---|---|
| High — Architectural pattern | Branching · cyclical · self-similar · maturational (`spec/`, gist 02) | Framing only while sections are Open |
| Ground — Governance SOP | `BLOOM-PROTOCOL.md` + Genesis · Coordination · Seed | Authority for modularity, cycle, multi-agent mechanics |
| Instance — Cycle / product build | Spore → Seed → Sprout → Bloom; this **Master Build Pattern** stack | How agents ship units toward a product |

This pattern sits at **ground + instance**: SOP cycle + proven Seed / worktree / audit / preview / publish / CLOSEOUT ops, generalized.

---

## 3 · Roles

Human **Admin** is the governor. Every instance must also ship a **bee roster** in `AGENTS.md` (Executive-ops, Design, Research Brain, …) per `lk-bloom/hive/ORCHESTRATION.md` §6. Local project boundary: `ORCHESTRATION.md` §0a.

| Role | Owns | Must not |
|---|---|---|
| **Admin** (human) | Program lock after Seed; PREP/READY go (when admin-gated); sandbox preview; waivers; merge authority; CP-0 mode; cross-hive share gates | Leave preview to agents as substitute; skip program lock |
| **Seed agent** | Draft MASTER-PLAN, WORKSTREAMS, first BP, COMPOSER, AGENTS (incl. bee roster + assigned paths) | Implement product feature code; CP-0; open worktrees; grant program lock |
| **Executive-ops bee** | Executive docs; COMPOSER/INSTANCES hygiene drafts | Program lock; promote; preview; merge |
| **Design bee** | design-handoff; UI catalog slots | Feature merge without audit/preview; expand walls alone |
| **Orchestrator** | Pick unit, CP-0 (per CP0-POLICY), spawn build/audit, keep ledger true, escalate; may run CLOSEOUT under Admin direction | Write feature code; auto-CP-0 unless automation-eligible + circumstances PASS; expand walls |
| **Build agent** | Implement unit in worktree (local project only); self-check acceptance; handoff-ready; optional draft worklogs | Audit itself; open PR before preview; run CLOSEOUT as substitute for merge; write outside assigned paths |
| **Audit agent** | Independent Check; report PASS / PASS-WITH-NOTES / FAIL | Commit to the build branch; grant preview approval |
| **Publisher** | PR after preview; attach audit; merge; ledger `pr-opened` / hand off to CLOSEOUT | Open PR without Admin preview approval; skip CLOSEOUT after land |

**Handoff-ready ≠ PR-ready ≠ closeout-done.**  
Handoff-ready = audited. PR-ready = audited + Admin sandbox-preview-approved (or written docs-only waiver). Closeout-done = land verified + SoR updated + dual worklogs at `workLogsRoot` + linked history at `historyRoot` + Brain digest (or deferred) + primary main synchronized + next pointer parked (CP-0 for next unit follows CP0-POLICY). A blocked primary sync is honest partial closeout, not full closeout-done, unless Admin records a waiver.

Full Admin-as-agent authority is **parked** — `lk-bloom/hive/registry/FUTURE-ADMIN-AGENT-LOCK.md`.

---

## 4 · Unit of work

One **implementation unit** = one blueprint (BP) or workstream (WS) slice:

- one git worktree outside the primary checkout  
- one branch from fresh `origin/main`  
- one independent audit report  
- one future PR (after preview)  
- one post-merge CLOSEOUT  

Primary repo checkout (the main project folder) stays on `main` (or the repo’s default integration branch) and stays synced to `origin/main` when practical (pull at session start / CLOSEOUT). Do **not** park long-lived feature work by checking out feature branches *in* the primary folder — that blocks `main` occupancy for other worktrees. New work uses dedicated worktrees with their own folders, scoped only as large as needed. Never leave a disposable worktree holding `main` after the unit ships — prune it or move it off `main` so the primary can check out `main` (example: packages LIVE `…/uvrn-packages_main-total-updates_LIVE` must own `main`; a shipped closing-release WT must not keep `main` checked out).

---

## 5 · The loop (Bloom §2 → ops)

### 5a · Seed (greenfield / new program)

```
Admin gives initial idea
  → SPAWN SEED AGENT (fresh context)
  → SEED-GUIDANCE: ask ≤5 Qs if patterns readily available; else draft hard + Assumptions
  → write: 00-MASTER-PLAN, WORKSTREAMS, BP-01, COMPOSER, AGENTS
       (propose CP-0 mode; default admin-gated)
  → STOP — awaiting Admin program lock (no CP-0, no worktree, no feature code)
  → Admin locks program (status → admin-locked / active)
  → hand off to unit loop (§5b)
```

Recipe: instance `04-agent-ops/PROGRAM-SEED.md`.

### 5b · Unit loop (after program lock)

```
CP-0 per CP0-POLICY (Admin unlock phrase OR automation-eligible circumstance PASS)
  → Orchestrator picks next unit (WORKSTREAMS + dependency graph)
  → append ledger `started` (CP-0)
  → git worktree add ../wt-<product>-… -b <product>/… origin/main
  → SPAWN BUILD AGENT (fresh context)
  → build agent: Plan → Build → Check (acceptance) → handoff-ready
       (optional draft worklogs under 04-agent-ops/)
  → SPAWN AUDIT AGENT (never the builder)
  → FAIL: fix (max 3 audit cycles) then escalate to Admin
  → PASS: STOP for Admin sandbox preview — do NOT open a PR yet
  → Admin preview-approved (or docs-only waiver)
  → Publisher: push (if needed) + open PR + merge per PUBLISHER.md
  → CLOSEOUT (after merge confirmation) — see §7
  → Next unit: again per CP0-POLICY (default park / do-not-start until Admin unlock)
```

Map to Bloom §2: Plan (Seed / PREP / CP-0) → Build → Check (audit) → Update (fixes) → Reflect (CLOSEOUT / worklogs / ledger) → Continue (per CP0-POLICY).

---

## 6 · Hard gates

### Required

| Gate | Rule |
|---|---|
| Admin program lock | After Seed: no unit CP-0 until program status is `admin-locked` or `active` |
| Independent audit | Never the build agent auditing itself |
| Human sandbox preview before PR | Admin may waive **docs-only** in writing |
| One unit / one worktree / one PR | No shared worktrees across units |
| Primary checkout on `main` (synced) | Feature units in dedicated worktrees; never leave a disposable WT occupying `main` |
| Append-only ledger + PREP → READY → HANDOFF | Unit lifecycle surfaces |
| Local safe defaults | No live spend / secrets in routine local work; product fills names |
| Publisher checklist | Through merge / handoff to CLOSEOUT |
| Post-merge CLOSEOUT | Full recipe in `04-agent-ops/CLOSEOUT.md` |
| Dual worklogs on CLOSEOUT | Overview + tech under product `workLogsRoot` (+ index); ledger one-line `reflect` does **not** replace them |
| Linked history on CLOSEOUT | One concise entry + newest-first index under product `historyRoot`; links worklogs/audits/findings instead of replacing them |
| CP-0 policy | Default `admin-gated`: no CP-0 until Admin unlock. `automation-eligible` only when adapter sets it **and** all CP0-POLICY circumstance checks PASS |

Docs-only units may use short worklog stubs; Admin may waive the **tech** log in writing on HANDOFF (same waiver class as preview for docs-only).

### Recommended (Required when product opts in)

| Slot | When Required |
|---|---|
| UI / chrome catalog before new surfaces | Product has a UI-catalog rule |
| `02-contracts/` | Shared API or white-label surface |
| `design-handoff/` | UI-heavy product |
| Architecture / OOP tip stamp on CLOSEOUT | Product maintains page/map docs and the unit shipped chrome |

Fill the product adapter section in `00-MASTER-PLAN.md` when adopting — including **`workLogsRoot`**, **`historyRoot`**, **program status**, and **CP-0 mode**.

---

## 6b · CP-0 policy (summary)

Canonical: [`scaffold/04-agent-ops/CP0-POLICY.md`](./scaffold/04-agent-ops/CP0-POLICY.md).

| Mode | Who starts units |
|---|---|
| `admin-gated` (default) | Admin unlock phrase before each gated CP-0 |
| `automation-eligible` | Orchestrator may auto-CP-0 when **all** circumstance checks PASS (in-domain; program locked; blueprint exists; COORDINATION ok; local safe defaults; preview rules still apply) |

**Never automatic:** Seed program lock; expanding hard walls / spend caps; out-of-domain units; skipping audit; skipping preview without a documented waiver class.

This pattern **defines** the policy surface for future pure-automation tasks; it does **not** ship a separate always-on automation daemon.

---

## 7 · Publisher vs CLOSEOUT

| Phase | Owner | Doc |
|---|---|---|
| Preview → PR open → merge | **Publisher** | [`scaffold/04-agent-ops/PUBLISHER.md`](./scaffold/04-agent-ops/PUBLISHER.md) |
| After land confirmed | **CLOSEOUT** (Admin or orchestrator under Admin) | [`scaffold/04-agent-ops/CLOSEOUT.md`](./scaffold/04-agent-ops/CLOSEOUT.md) |

Publisher does **not** absorb the full SoR/worklog/next-pointer recipe. After merge, run CLOSEOUT.

### CLOSEOUT shape (canonical)

1. **Verify land** — `gh pr view` MERGED + merge SHA; `git fetch origin`  
2. **Reflect SoR + doctrine impact** — WORKSTREAMS, COORDINATION, ledger, phase banners, and product-local durable docs when the landed codeframe changed them; otherwise record `no doctrine change`  
3. **Worklogs** — overview + tech under `workLogsRoot` (+ README index)  
4. **History map** — one concise `historyRoot` entry: codeframe, plan-vs-landed, anomalies, doctrine impact, evidence links, sync outcome, next pointer  
5. **Housekeeping + sync verify** — prune only if safe; FF primary to `origin/main`; verify `HEAD == origin/main`; preserve dirt and record `partial-blocked` or `invalid-precondition` honestly  
6. **Next pointer** — park next unit; CP-0 only per **CP0-POLICY** (default: explicit do-not-start until Admin unlock)

### What CLOSEOUT is not

- Not the build / audit / sandbox / PR-open path  
- Not merging the PR (Publisher / Admin already did that)  
- Not starting the next wave unless CP0-POLICY allows (Admin unlock or automation-eligible PASS)

### `workLogsRoot`

Product adapter declares the durable SoR path (+ index README). CLOSEOUT finalizes overview + tech there. Unit-local drafts under build-master `04-agent-ops/*-work-log*` are allowed during the unit; **SoR is authoritative after land**.

Naming at SoR (default): `YYYY-MM-DD-<product>-<unit>-overview.md` + `…-tech.md`.

### `historyRoot`

Product adapter declares the navigable historical map. Each CLOSEOUT appends one concise unit entry and a newest-first index row. It summarizes and links the ledger, dual worklogs, audits, findings/reports, and architecture/OOP tips; it does not replace any of them.

Doctrine-impact review is product-local by default. Update an instance MASTER-PLAN, local ADR, architecture/OOP page, or admin guide only when the landed unit changed a durable rule or codeframe; otherwise record `no doctrine change`. Shared lk-bloom doctrine is a residual/Admin note unless lk-bloom itself is the authorized active unit.

### Concurrent CLOSEOUT ownership

One build-master may have several landed units, but only one agent finalizes shared CLOSEOUT surfaces at a time. Before editing WORKSTREAMS, ledger, COORDINATION, `historyRoot`, shared maps, or primary main, acquire the instance lease defined in `04-agent-ops/COORDINATION.md`; re-read those surfaces after acquisition and confirm the durable ownership row names the same unit/agent/merge SHA. A held or ambiguous lease means wait/stop—never overwrite or clear it without the owner or Admin.

Parallel agents may draft unit-specific overview/tech logs before the lease. Final indexing, SoR reflection, shared doctrine/map stamps, cleanup, and main synchronization are serialized. After fetch, verify the unit merge SHA is an ancestor of current `origin/main`; current main may include later merges. Record the unit merge SHA and the final synchronized main tip separately. Remove only the claimed unit’s clean/SHA-matched worktree, then release the durable row and atomic lease last.

Before reflection or cleanup, build a branch reconciliation manifest from: recorded unit start/base SHA, PR base/head SHAs and PR files/commits, the landed merge delta, current branch/worktree state, and agent contribution handoffs. Build the ordered unit-start..head commit ledger; each commit needs exactly one named owner, each path needs both scope and contribution evidence, and overlapping path claims need explicit sequence/handoff evidence. For squash merges, remap original commits by PR path/patch content rather than expecting their OIDs on main. Explicitly classify merge-resolution differences, known generated files, superseded changes, later branch advances, and uncommitted dirt with evidence links. If a change is absent from one view or has no owner/evidence, record a `gap`; mark overall CLOSEOUT `partial-blocked`, preserve the branch/worktree, and route ownership/remediation to Admin—even if primary-main sync itself completes. Never backfill authorship from the branch name.

---

## 8 · Documentation surfaces

| Surface | Job |
|---|---|
| `COMPOSER.md` | Main system guide for this instance (cold-start map, Seed → unit → CLOSEOUT, pointers) |
| `AGENTS.md` | Agent team orchestration (roles, spawn order, must-nots, CP-0 spawn rules) |
| `00-MASTER-PLAN.md` | Locked product decisions + product adapter (`workLogsRoot`, `historyRoot`, program status, CP-0 mode, …) |
| `WORKSTREAMS.md` | Live queue (open / gated / closed) |
| `01-blueprints/` | Units + append-only event ledger |
| `02-contracts/` | API / data shapes (when used) |
| `03-audit/` | Protocol + reports archive |
| `04-agent-ops/` | Coordination, Seed, CP0-POLICY, prompts, PREP/READY/HANDOFF, PUBLISHER, CLOSEOUT, draft worklogs |
| Product `workLogsRoot` | Durable overview + tech session logs (+ index) |
| Product `historyRoot` | Newest-first wiki/archive map + concise per-unit entries |
| `design-handoff/` | Approved design package (when used) |

---

## 9 · Scaffold adopt

1. Copy `lk-bloom/hive/master-build/scaffold/` to a product build-master path (e.g. `<executive>/<product>_build-master/`).
2. Rename `*.template` files; fill `⟨placeholders⟩` **or** run Seed-from-idea (`04-agent-ops/PROGRAM-SEED.md` + `SEED-AGENT-PROMPT`).
3. Admin **program lock** (MASTER-PLAN status → `admin-locked` / `active`); set CP-0 mode (`admin-gated` default).
4. Point agents at instance `COMPOSER.md` → `AGENTS.md` → this doctrine (patternVersion pin).
5. Register a row in [`INSTANCES.md`](./INSTANCES.md).

Copyable tree: [`scaffold/`](./scaffold/).

### 9a · Agent Team Pools (sibling pack)

For multi-domain org charts + per-pool Research Brains (insight / highlights / inbox), adopt the sibling pack — **not** a substitute for this unit-loop scaffold:

1. Copy `lk-bloom/hive/agent-team-pools/scaffold/` → e.g. `<executive>/<product>-master-dev-bot-pool/`.
2. Rename templates; run **Master Pool Lead** with a domain → path map (or fill by hand).
3. Admin **pool lock**; register [`../agent-team-pools/INSTANCES.md`](../agent-team-pools/INSTANCES.md) (`poolPatternVersion` matching that pack).

Doctrine: [`../agent-team-pools/POOL-PATTERN.md`](../agent-team-pools/POOL-PATTERN.md). Job board remains this pattern’s WORKSTREAMS / BP.

---

## 10 · Non-goals

- Not a rewrite or replacement of `BLOOM-PROTOCOL.md`
- Not a Decided pass on the architectural spec (`lk-bloom_spec-1`)
- Not a forced restructure of live product build-masters onto the scaffold (instances pin and upgrade deliberately)
- Not product-specific honesty / spend / UI walls
- Not editing Cursor/Claude `work-log` / `work-log-tech` skills (cite them; templates mirror their sections)
- Not an always-on automation daemon / scheduler (CP0-POLICY is the rules surface only)
- Not auto program-lock after Seed (Admin remains governor)
- Not a replacement for Agent Team Pools (sibling pack) — unit loop and pool org chart stay separate

---

## See also

- [`README.md`](./README.md) — CHARTER cold-start  
- [`INSTANCES.md`](./INSTANCES.md) — registered instances  
- [`scaffold/`](./scaffold/) — copyable unit-loop tree  
- [`../agent-team-pools/`](../agent-team-pools/) — pool org chart + Research Brain pack  
- [`../ORCHESTRATION.md`](../ORCHESTRATION.md) — hive cold-start bible  
- Distill: `lk-bloom/hive/distill/` (esp. `00`, `05`)  
- Bloom SOP: `dispatch/agent-doc-master/governance/bloom-protocol/`
