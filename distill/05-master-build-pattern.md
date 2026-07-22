# Master Build Pattern — Operator Distillation

> **Audience:** humans + agents  
> **Status:** mature  
> **Last updated:** 2026-07-22  
> **Canonical source:** `lk-bloom/hive/master-build/MASTER-BUILD-PATTERN.md` (v0.5.1)

> If you haven't read [`00-three-blooms-disambiguation.md`](./00-three-blooms-disambiguation.md), read that first. This distill covers the **operational build pattern** that sits under Bloom SOP (ground) and produces product units toward a cycle-object bloom. It is **not** a fork of `BLOOM-PROTOCOL.md` and **not** Decided architectural-spec authorship.

## TL;DR

For multi-agent product work, use **Master Build Pattern v0.5** under **`lk-bloom/hive/`**:

- **Seed-from-idea** → draft MASTER-PLAN + WORKSTREAMS + BP-01 + `COMPOSER.md` + `AGENTS.md` → **Admin program lock**  
- Roles: Admin · Seed · Orchestrator · Build · Audit · Publisher (+ Pool Lead · Research Brain in sibling pack)  
- Unit loop: worktree → audit → preview → PR → **CLOSEOUT** (dual worklogs + history + leases + Brain digest)  
- **CP-0 policy:** default `admin-gated`; optional `automation-eligible` in-domain auto CP-0 when circumstance checks PASS (rules surface only — not a daemon)  

Cold-start bible: `lk-bloom/hive/ORCHESTRATION.md`.  
Canonical doctrine + scaffold: `lk-bloom/hive/master-build/`. Instances pin `patternVersion`, `workLogsRoot`, `historyRoot`, and CP-0 mode in their own build-master.

## What this is

Bloom’s governance SOP tells agents how to cycle (Plan → Build → Check → Update → Reflect → Continue). Master Build Pattern is the shared ops stack so every agentic team shares one adopt path without reading another product’s build-master.

| Piece | Where |
|---|---|
| Hive bible | `lk-bloom/hive/ORCHESTRATION.md` |
| Doctrine | `lk-bloom/hive/master-build/MASTER-BUILD-PATTERN.md` |
| Cold-start CHARTER | `lk-bloom/hive/master-build/README.md` |
| Copyable scaffold | `lk-bloom/hive/master-build/scaffold/` |
| Instance registry | `lk-bloom/hive/master-build/INSTANCES.md` |
| Pool sibling | `lk-bloom/hive/agent-team-pools/` |

## How it works (compressed)

### Seed (greenfield)

1. Admin gives an initial idea.  
2. Seed agent follows `SEED-GUIDANCE.md`: ask ≤5 Qs if patterns are readily available; else draft hard + Assumptions.  
3. Writes MASTER-PLAN, WORKSTREAMS, BP-01, COMPOSER, AGENTS.  
4. Stops — **awaiting Admin program lock** (no CP-0, no worktree).  
5. Admin locks program → status `admin-locked` / `active`.

### Unit loop (after program lock)

1. CP-0 per `CP0-POLICY.md` (Admin unlock **or** automation-eligible PASS).  
2. Orchestrator: worktree from `origin/main` → spawn Build.  
3. Separate Audit → PASS / FAIL (max 3).  
4. Admin sandbox preview (handoff-ready ≠ PR-ready).  
5. Publisher opens PR / merges.  
6. **CLOSEOUT:** verify land → SoR → overview+tech at `workLogsRoot` → history at `historyRoot` → prune/ff-pull (keep local dirt) → next pointer per CP0-POLICY.

Required gates (summary): Admin **program** lock · independent audit · preview before PR · one unit / worktree / PR · primary on `main` · ledger + PREP/READY/HANDOFF · local safe defaults · publisher through merge · **CLOSEOUT** · **dual worklogs** · history map · CP-0 per policy (default admin-gated).

Ledger one-line `reflect` does **not** replace worklogs. Auto-CP-0 never skips audit/preview or expands walls.

## For agents

- Cite **patternVersion** (`0.5`) when invoking.  
- Cold-start: `hive/ORCHESTRATION.md` → instance `COMPOSER.md` → `AGENTS.md` → doctrine → COORDINATION / AUDIT / MASTER-PLAN.  
- Do not treat this distill as a second rulebook.  
- Do not blend altitudes; do not author Open architectural-spec sections.  
- Product hard walls + `workLogsRoot` + `historyRoot` + CP-0 mode live only in the instance MASTER-PLAN adapter.  
- Do not CP-0 while program status is `seed-draft`.  
- Do not auto-CP-0 unless mode is `automation-eligible` and all CP0-POLICY checks PASS.

## What this is not

- Not a replacement for gist 01 / `BLOOM-PROTOCOL.md`  
- Not the architectural pattern (gist 02 / `spec/`)  
- Not the lifecycle cycle object (gist 03)  
- Not the Agent Team Pool pack (sibling under `hive/agent-team-pools/`)
