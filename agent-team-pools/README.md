# Agent Team Pools — home (hive)

**poolPatternVersion:** `0.3`  
**Canonical doctrine:** [`POOL-PATTERN.md`](./POOL-PATTERN.md)  
**Companion:** Master Build Pattern `0.5.1` ([`../master-build/MASTER-BUILD-PATTERN.md`](../master-build/MASTER-BUILD-PATTERN.md))  
**Hive cold-start:** [`../ORCHESTRATION.md`](../ORCHESTRATION.md)

Org-chart pack for multi-domain products: pools, working teams, Research Brains, Master Pool Lead. Complements (does not replace) product `_build-master` unit loops.

---

## CHARTER — cold-start (instance)

Agents starting a pool instance: read **hive `ORCHESTRATION.md` first**, then:

1. Instance `COMPOSER.md` — product map + status  
2. Instance `AGENTS.md` — Lead / Brain / team spawn rules  
3. [`POOL-PATTERN.md`](./POOL-PATTERN.md) — doctrine  
4. Instance `REGISTRY.md` — pool roster  
5. Instance `INBOX.md` — escalations only  
6. [`PROMOTE-TO-WORKSTREAMS.md`](./PROMOTE-TO-WORKSTREAMS.md) — Admin-only promote recipe  

Then: the relevant `pools/<id>/` README + BRAIN-PROMPT / TEAMS.

**Greenfield:** paste `MASTER-POOL-LEAD-PROMPT.md` with Admin path map (before pool lock).

**Opt-in recurring research:** [`persistent-research/HOW-TO-PERSISTENT-RESEARCH.md`](./persistent-research/HOW-TO-PERSISTENT-RESEARCH.md).

---

## Layout

| Path | What |
|---|---|
| [`POOL-PATTERN.md`](./POOL-PATTERN.md) | Doctrine v0.3 |
| [`PROMOTE-TO-WORKSTREAMS.md`](./PROMOTE-TO-WORKSTREAMS.md) | Admin Brain → job board |
| [`IDEA-EXCHANGE.md`](./IDEA-EXCHANGE.md) | Cross-pool idea swap (Horizon 2) |
| [`persistent-research/`](./persistent-research/) | Opt-in Persistent Research Kit |
| [`INSTANCES.md`](./INSTANCES.md) | Registered pool instances |
| [`scaffold/`](./scaffold/) | Copy for a new product pool instance |

---

## Adopt in one line

```bash
cp -R ⟨lk-bloom⟩/hive/agent-team-pools/scaffold \
  /path/to/<product>-master-dev-bot-pool
# rename *.template, copy pools/_POOL.template → pools/<id>/ per domain,
# run Master Pool Lead (path map), Admin pool lock, register INSTANCES.md
```

---

## Authority boundaries

| Source | Use for |
|---|---|
| This pack | Domain pools, Research Brains, insight inbox |
| Persistent Research Kit | Bounded recurring insight (charter + validate script) |
| Product `_build-master` | WORKSTREAMS / BP / worktree / audit / preview / CLOSEOUT |
| Product site `AGENTS.md` | Site-local agent runbook pointers |
| Bloom Protocol | Governance SOP when 2+ writers |
| [`../ORCHESTRATION.md`](../ORCHESTRATION.md) | Universal cold-start |

Dispatch / product lore stays in instances — not in this doctrine tree.
