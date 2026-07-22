# Future — Admin-agent lock protocol (parked)

**Status:** parked / **not enabled**  
**Date:** 2026-07-22  
**Live law today:** human Admin is the only governor. “Admin agent” means **Executive-ops bee** under human unlock (`hive/ORCHESTRATION.md` §6).

---

## Intent (option 2 — background)

Someday an **Admin-agent** bee may perform selected governor actions (program/pool lock, promote, preview ack) **only when** a higher-level **Steward lock** is unlocked by a human meta-governor.

Until this Seed is unlocked and Decided, agents **must not** assume Admin-agent powers.

---

## Sketch (not live)

| Layer | Who | Powers |
|---|---|---|
| **Steward** (human) | Meta-governor | Unlock / revoke Admin-agent mode for a product + window |
| **Admin-agent** (bee) | Only while Steward lock active | Subset of lock / promote / preview per circumstance checks |
| **Human Admin** | Always available | Override, revoke, waiver |

### Required before enablement

- Circumstance checklist (mirrors CP0-POLICY rigor)
- Durable audit trail of every Admin-agent action
- Never silently expand product walls
- Revocable Steward lock with expiry
- Explicit product adapter flag (default off)
- No cross-hive share without Steward or human Admin gate

### Must never

- Auto-unlock Steward lock
- Skip independent audit / preview evidence
- Treat Executive-ops as Admin-agent without Steward unlock

---

## Related

- Live cold-start: [`../ORCHESTRATION.md`](../ORCHESTRATION.md) §0a · §6  
- Parked seed id: `SEED-HIVE-07` in [`PARKED-SEEDS.md`](./PARKED-SEEDS.md)  
- Roadmap: [`../HIVE-ROADMAP.md`](../HIVE-ROADMAP.md)  
