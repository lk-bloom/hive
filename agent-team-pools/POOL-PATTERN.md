# Agent Team Pool Pattern

**poolPatternVersion:** `0.3`  
**Companion:** Master Build Pattern `0.5.1` ([`../master-build/MASTER-BUILD-PATTERN.md`](../master-build/MASTER-BUILD-PATTERN.md))  
**Scaffold:** [`scaffold/`](./scaffold/)  
**Hive cold-start:** [`../ORCHESTRATION.md`](../ORCHESTRATION.md)

Reusable org-chart for multi-domain product work: **pools** (departments), **teams** (roles), **Research Brain** (pool insight), and a **Master Pool Lead** that fills a product instance from real paths.

This pack does **not** replace Master Build unit loops (`WORKSTREAMS` / BP / worktree / audit / preview / CLOSEOUT). It sits **beside** them: who watches which domain, where highlights live, how insight escalates.

**Changelog `0.2` → `0.3`:** Opt-in Persistent Research Kit (`persistent-research/`) — charter, bounded Brain prompt (ingest/query/lint), RUN-LOG, validate-only `check-research-loop.sh`, docs smoke. No daemon, no CP-0, no model runner. Instances re-pin deliberately.

**Changelog `0.1` → `0.2`:** Brain digests from CLOSEOUT (`DIGESTS/`); Admin promote recipe (`PROMOTE-TO-WORKSTREAMS.md`); cross-pool idea exchange (`IDEA-EXCHANGE.md`); companion pin Master Build `0.5`; docs-only smoke instance.

---

## 1 · Layers

| Layer | Location | Job |
|---|---|---|
| **Template** | `lk-bloom/hive/agent-team-pools/scaffold/` | Product-agnostic blank org chart |
| **Instance** | e.g. `<executive>/<product>-master-dev-bot-pool/` | Filled pools, brains, inbox for one product |
| **Opt-in kit** | `lk-bloom/hive/agent-team-pools/persistent-research/` | Recurrence discipline for Research Brains |

**Job board** (WORKSTREAMS / BP) = *what to ship*.  
**Pool instance** = *who watches / who builds / what insight was noticed*.

---

## 2 · Roles

| Role | Owns | Must not |
|---|---|---|
| **Admin** (human) | Pool lock; research-charter lock / pause; promote proposals → WORKSTREAMS; ack INBOX | Leave escalate-to-ship to agents alone |
| **Master Pool Lead** | Fill instance from scaffold + path map; route cross-pool INBOX | Feature code; worktrees; auto-promote WS; OpenRouter for routine local research |
| **Research Brain** (per pool) | Watch pool paths; HIGHLIGHTS; DIGESTS; PROPOSALS; escalate to INBOX; optional Persistent Research sessions | Feature PRs; replace WORKSTREAMS; silent OpenRouter spend |
| **Working teams** (per pool) | Orchestrator / Build / Audit / domain specialists as listed in `TEAMS.md` | Cross pool walls without Admin |

Handoff to Master Build: when a proposal is promoted, use the product’s `_build-master` unit loop — not this pack’s Lead/Brain. Recipe: [`PROMOTE-TO-WORKSTREAMS.md`](./PROMOTE-TO-WORKSTREAMS.md).

---

## 3 · Research Brain

Each pool’s Brain is the **main brain** of that department.

| Job | Behavior |
|---|---|
| Watch | Pool allowed paths, recent handoffs/audits, related docs |
| Digest | Ingest CLOSEOUT Brain digests under `DIGESTS/` |
| Insight | Propose enhancements / risks for **review** |
| Store | Append to pool `HIGHLIGHTS.md` |
| Escalate | Only `interesting` / `important` → instance `INBOX.md` |
| Exchange | `@mention` sibling pools per [`IDEA-EXCHANGE.md`](./IDEA-EXCHANGE.md) |
| Ground | Local ops research = Cursor search tools; never product OpenRouter keys for routine Brain runs |

Triggers: after unit CLOSEOUT digest; after handoff/audit in-domain; light recurring skim; Admin ask (“what’s this brain seeing?”); **opt-in Persistent Research Kit** sessions when Admin locks a research charter.

---

## 3a · Persistent Research Kit (opt-in)

Recurrence **discipline** for Brains that need bounded, repeatable insight loops.

| Rule | Detail |
|---|---|
| Home | [`persistent-research/`](./persistent-research/) |
| Enable | Admin fills charter → `admin-locked` → `start research loop` → `active` (**not** CP-0) |
| Pause | `PAUSE` file beside charter |
| Validate | `persistent-research/scripts/check-research-loop.sh` (never calls models) |
| Writes | HIGHLIGHTS · DIGESTS · PROPOSALS · INBOX (+ optional wiki/index if charter enables) |
| Modes | ingest · query · lint (within max iterations) |
| Scheduler | External cron/GHA may open an agent session; Hive embeds no daemon |

Admin guide: [`persistent-research/HOW-TO-PERSISTENT-RESEARCH.md`](./persistent-research/HOW-TO-PERSISTENT-RESEARCH.md).

---

## 4 · Adopt

1. Copy `scaffold/` → instance path (e.g. `<executive>/<product>-master-dev-bot-pool/`).
2. Rename `*.template` (drop `.template`). For each pool: copy `pools/_POOL.template/` → `pools/<pool-id>/` and rename templates inside.
3. Paste **Master Pool Lead** prompt (`MASTER-POOL-LEAD-PROMPT.md`); fill Admin path map.
4. Lead fills REGISTRY, COMPOSER, AGENTS, pool folders, Brain prompts; status → `seed-draft`.
5. Admin **pool lock** (`REGISTRY.md` / COMPOSER status → `admin-locked` / `active`).
6. Register in [`INSTANCES.md`](./INSTANCES.md) with `poolPatternVersion: 0.3`.
7. Optional: pointer from product build-master `COORDINATION.md` / site `AGENTS.md` → this instance.
8. Optional: enable Persistent Research Kit per [`persistent-research/HOW-TO-PERSISTENT-RESEARCH.md`](./persistent-research/HOW-TO-PERSISTENT-RESEARCH.md).

---

## 5 · Red lines

- Instance is **not** a second job board (no shadow WS status SoR).
- Lead / Brain do **not** open feature PRs or grant CP-0.
- Product-specific paths live only in the **instance**, never in the template doctrine.
- Master Build unit scaffold remains the shipping path for BP/WS units.
- Digests and proposals are insight until Admin promotes.
- Persistent Research is not a model runner and not a CP-0 path.

---

## See also

- [`README.md`](./README.md) — adopt + cold-start  
- [`INSTANCES.md`](./INSTANCES.md) — registered pool instances  
- [`persistent-research/`](./persistent-research/) — opt-in recurrence kit  
- [`PROMOTE-TO-WORKSTREAMS.md`](./PROMOTE-TO-WORKSTREAMS.md) — Admin promote recipe  
- [`IDEA-EXCHANGE.md`](./IDEA-EXCHANGE.md) — cross-pool swap  
- [`scaffold/`](./scaffold/) — copyable tree  
- [`../master-build/MASTER-BUILD-PATTERN.md`](../master-build/MASTER-BUILD-PATTERN.md) — unit-loop build ops  
- [`../ORCHESTRATION.md`](../ORCHESTRATION.md) — hive cold-start bible  
