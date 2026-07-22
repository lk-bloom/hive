# Hive Roadmap — scale to 100+ agents

**Status:** Decided-as-roadmap (not implemented runtimes)  
**Date:** 2026-07-22  
**Canonical:** `lk-bloom/hive/HIVE-ROADMAP.md`  
**Cold-start:** [`ORCHESTRATION.md`](./ORCHESTRATION.md)

**Active vs parked:** **Active** = process docs and operating guidance in this file (and linked hive doctrine). **Parked** = tooling Seeds in §6 / [`registry/PARKED-SEEDS.md`](./registry/PARKED-SEEDS.md) — not built here yet.

This document is the long-horizon vision for the hive system. It does **not** ship daemons. Tooling below is parked as future Seeds.

---

## 1 · Target operating model

```
many products
  × many build-master instances (unit loops)
  × many pool instances (org charts + Brains)
  × many concurrent units (worktrees + CLOSEOUT leases)
  = one protocol (hive)
```

Every agent still cold-starts from `ORCHESTRATION.md`. Density increases; process does not fork.

---

## 2 · Swarm capacity / leases

| Concern | Rule |
|---|---|
| Concurrent builds | One worktree / unit / PR; many units OK across branches |
| CLOSEOUT | One atomic build-master lease for shared finalization (MBP) |
| Pools | Brains write insight only; Admin promotes |
| Cross-pool | `@mention` + INBOX routing — no race CP-0 |
| Cross-hive | Local project only; file/agent share needs human Admin gate |
| Quality under load | Never skip audit / preview / program lock to “go faster” |

Generalization: **throughput = concurrent units that still pass gates**, not agents without gates.

---

## 3 · Brain scheduling conventions

| Mode | When |
|---|---|
| Human-paced | Default — Admin asks or CLOSEOUT digest triggers a skim |
| Light recurring | Optional Admin cadence per pool (still Cursor search; no silent OpenRouter) |
| Automation-eligible CP-0 | Only where product MASTER-PLAN CP-0 mode allows **and** CP0-POLICY checks PASS — not a hive daemon |

---

## 4 · Quality under load (exquisite guidelines)

- Same cold-start for a 1-agent docs unit and a 100-agent program  
- Role owns / must-not never dilute  
- Bee roster required on every new build system  
- Local project boundary — cross-hive share only with human Admin gate  
- Proposal → ship conversion requires Admin promote  
- Doctrine drift caught via CLOSEOUT digests → `hive/proposals/`  
- Cross-pool collisions escalate to INBOX — Admin decides  

---

## 5 · Success metrics

| Metric | Intent |
|---|---|
| Time-to-cold-start | Cold agent finds role + next action from hive + instance alone |
| CLOSEOUT completeness | Digests + history + dual worklogs present or honestly deferred |
| Proposal → ship conversion | Admin-promoted cards that become landed units |
| Doctrine drift rate | Unplanned hive edits vs accepted proposals |
| Cross-pool collision rate | Competing promotes / unresolved INBOX races |

---

## 6 · Parked tooling seeds (not built here)

Each becomes its own Seed / BP when Admin unlocks:

| Seed | Job |
|---|---|
| **Digest aggregator** | Roll up pool DIGESTS across a product into one skim |
| **Pattern-upgrade docs bot** | Draft `hive/proposals/` from digest residuals (docs-only; Steward accepts) |
| **Lease dashboard** | Show active CLOSEOUT leases / worktrees (observability) |
| **Optional CP-0 runner** | Only for `automation-eligible` instances — still obeys CP0-POLICY |
| **Shared GROWTH-STAGES package** | Lifecycle UI (meaning #3) for lk_signature — separate from build ops |
| **Measure / observability** | Demand→…→Evolve Measure stage instrumentation |
| **Admin-agent Steward lock** (`SEED-HIVE-07`) | Future option 2 — Admin-agent powers only while human Steward lock unlocked; see [`registry/FUTURE-ADMIN-AGENT-LOCK.md`](./registry/FUTURE-ADMIN-AGENT-LOCK.md) |

---

## 7 · Architectural spec cadence (meaning #2)

- Keep `lk-bloom/spec/lk-bloom_spec-1/` **Open** until Decided  
- Use Horizon 2 digest evidence to prioritize Groups A–H  
- Never blend Decided law into Open framing  
- Hive ops remain authoritative for agent day-to-day regardless of spec status  

---

## 8 · Next Admin picks

1. Commit `hive/` when ready (see `registry/H1-CANONIZE-NOTE.md`)  
2. Re-pin chosen UVRN instances to `hive/` paths + MBP `0.5.1` / pool `0.2` deliberately  
3. Unlock a parked tooling Seed only when a product needs it  
4. Do **not** enable Admin-agent mode until `SEED-HIVE-07` is Decided  

---

## See also

- [`registry/HIVE-MAP.md`](./registry/HIVE-MAP.md) — multi-product hive map  
- [`registry/FUTURE-ADMIN-AGENT-LOCK.md`](./registry/FUTURE-ADMIN-AGENT-LOCK.md) — parked Admin-agent protocol  
- [`proposals/README.md`](./proposals/README.md) — hive upgrade inbox  
- [`master-build/MASTER-BUILD-PATTERN.md`](./master-build/MASTER-BUILD-PATTERN.md)  
- [`agent-team-pools/POOL-PATTERN.md`](./agent-team-pools/POOL-PATTERN.md)  
