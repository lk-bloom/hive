# Hive Glossary

Cite-only. Definitions point at canon — do not invent new meanings here.

| Term | Meaning | Canon |
|---|---|---|
| **Bee** | An individual agent instance in a named role on a product | [`ORCHESTRATION.md`](./ORCHESTRATION.md) §6 |
| **Bee roster** | Required role table in instance `AGENTS.md` (owns / must-not + assigned paths) | [`ORCHESTRATION.md`](./ORCHESTRATION.md) §6 · Seed `AGENTS.md` |
| **Local project boundary** | Default: a bee may only read/write inside its assigned product paths; cross-hive share needs human Admin gate | [`ORCHESTRATION.md`](./ORCHESTRATION.md) §0a |
| **Bloom #1** | Bloom Protocol — governance SOP (Plan → Build → Check …) | [`distill/00-three-blooms-disambiguation.md`](./distill/00-three-blooms-disambiguation.md) |
| **Bloom #2** | Architectural pattern (branching / cyclical / self-similar) — cite Open vs Decided in `lk-bloom/spec/` | same distill |
| **Bloom #3** | Lifecycle cycle object (Spore → Seed → Sprout → Bloom) | same distill |
| **Hive ops** | How agents ship and watch — this folder; not a fourth Bloom meaning | [`ORCHESTRATION.md`](./ORCHESTRATION.md) §2 |
| **CP-0** | Controlled prep / ledger `started` + unit worktree spawn gate | `master-build/scaffold/04-agent-ops/CP0-POLICY.md` |
| **CLOSEOUT** | Post-merge SoR + dual worklogs + history + leases ritual | `master-build/scaffold/04-agent-ops/CLOSEOUT.md` |
| **Promote** | Admin-only move of pool insight into product WORKSTREAMS / BP | [`agent-team-pools/PROMOTE-TO-WORKSTREAMS.md`](./agent-team-pools/PROMOTE-TO-WORKSTREAMS.md) |
| **Pool Brain** | Research / insight bee — HIGHLIGHTS, DIGESTS, PROPOSALS; not a second job board | [`ORCHESTRATION.md`](./ORCHESTRATION.md) §5–§6 |
| **Worktree** | Isolated build checkout spawned after CP-0 from fresh `origin/main` | [`ORCHESTRATION.md`](./ORCHESTRATION.md) §4 |
| **Handoff-ready** | Build+audit complete enough for Admin preview — **not** PR-ready | [`ORCHESTRATION.md`](./ORCHESTRATION.md) §6 |
| **PR-ready** | Preview-approved; Publisher may open PR | same |
| **MBP / patternVersion** | Master Build Pattern version pin (tip **0.5.1**) | [`master-build/MASTER-BUILD-PATTERN.md`](./master-build/MASTER-BUILD-PATTERN.md) |
| **poolPatternVersion** | Agent Team Pools pack version pin (tip **0.2**) | [`agent-team-pools/POOL-PATTERN.md`](./agent-team-pools/POOL-PATTERN.md) |

**Cold-start:** [`ORCHESTRATION.md`](./ORCHESTRATION.md).
