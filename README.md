# Hive — Lyrikai master multiagent system

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)
[![Master Build Pattern](https://img.shields.io/badge/MBP-0.5.1-blue.svg)](./master-build/)
[![Agent Team Pools](https://img.shields.io/badge/Pools-0.3-blue.svg)](./agent-team-pools/)

**Canonical SoR** for idea → prep → build → audit → closeout → learn across Lyrikai agentic teams.

**Cold-start (every agent, every time):** read [`ORCHESTRATION.md`](./ORCHESTRATION.md) first — includes local project boundary + bee roster.

**Versions:** Master Build Pattern **0.5.1** · Agent Team Pools **0.3**

Authored by [Lyrikai](https://lyrikai.com/). Parent company: [Suttle Media](https://www.suttlemedia.com/).

## Who is this for?

- Solo operators running Cursor/Claude agents who want a repeatable build loop with human gates
- Teams scaling from a few agents to coordinated pools (org chart + Research Brains) without daemon sprawl
- Houses that need clear public vs private publish boundaries for pattern libraries

If you want human-in-the-loop governance, local project walls, and no silent agent self-merge — this is for you.

## Loop at a glance

```mermaid
flowchart LR
  idea[Idea] --> seed[Seed]
  seed --> lock[AdminProgramLock]
  lock --> cp0[PREP_CP0]
  cp0 --> build[Build]
  build --> audit[Audit]
  audit --> preview[AdminPreview]
  preview --> pr[PR_Merge]
  pr --> closeout[CLOSEOUT]
  closeout --> learn[Learn]
```

Full cold-start bible (roles, walls, bee roster): [`ORCHESTRATION.md`](./ORCHESTRATION.md).

## Quick Start

1. Read [`ORCHESTRATION.md`](./ORCHESTRATION.md) (cold-start bible).
2. Copy [`master-build/scaffold/`](./master-build/scaffold/) and/or [`agent-team-pools/scaffold/`](./agent-team-pools/scaffold/) (see each scaffold README adopt steps).
3. Rename templates → Admin program/pool lock → register (private live ledger on Admin machines; public tip lists smoke/docs-only only).

| Path | What |
|---|---|
| [`ORCHESTRATION.md`](./ORCHESTRATION.md) | Universal cold-start bible |
| [`GLOSSARY.md`](./GLOSSARY.md) | Cite-only term index |
| [`HIVE-ROADMAP.md`](./HIVE-ROADMAP.md) | Scale vision (100+ agents) |
| [`PUBLICATION.md`](./PUBLICATION.md) | What may be public vs private |
| [`CONTRIBUTING.md`](./CONTRIBUTING.md) | Proposals + Admin steward rules |
| [`CODE_OF_CONDUCT.md`](./CODE_OF_CONDUCT.md) | Community standards |
| [`SECURITY.md`](./SECURITY.md) | How to report security concerns |
| [`LICENSE`](./LICENSE) | MIT |
| [`master-build/`](./master-build/) | Master Build Pattern **v0.5.1** (unit loop) |
| [`agent-team-pools/`](./agent-team-pools/) | Agent Team Pools **v0.3** (org chart + Brains + Persistent Research Kit) |
| [`doctrine/`](./doctrine/) | OOP + React-universal ADRs |
| [`distill/`](./distill/) | Short operator notes |
| [`proposals/`](./proposals/) | Hive pattern/doctrine upgrade inbox |
| [`registry/`](./registry/) | Public hive map template |
| [`scripts/publish-public-tip.sh`](./scripts/publish-public-tip.sh) | Dual-publish allowlist guard (dry-run default) |

**Smoke (frozen fixtures):** dated work-logs and digests under `instances/smoke-*` are **docs-only examples**, not live product ops. See [`master-build/instances/smoke-hive-0_5`](./master-build/instances/smoke-hive-0_5) · [`master-build/instances/smoke-docs-only`](./master-build/instances/smoke-docs-only) · [`agent-team-pools/instances/smoke-docs-only`](./agent-team-pools/instances/smoke-docs-only) · [`agent-team-pools/instances/smoke-persistent-research`](./agent-team-pools/instances/smoke-persistent-research).

**Clone:** this repo is the public pattern home ([lk-bloom/hive](https://github.com/lk-bloom/hive)). Live product registries are not published here.

If Hive helps your agent workflows, star the repo — it helps others find the pattern.
