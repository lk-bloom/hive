# Master Build Pattern — home (hive)

**patternVersion:** `0.5.1`  
**Canonical doctrine:** [`MASTER-BUILD-PATTERN.md`](./MASTER-BUILD-PATTERN.md)  
**Hive cold-start:** [`../ORCHESTRATION.md`](../ORCHESTRATION.md) (read first)

Operational build pattern for all Suttle Media / Lyrikai agentic teams: Seed-from-idea → Admin program lock → worktree / audit / preview / publish / **post-merge CLOSEOUT**, with CP-0 policy for human-paced or in-domain automation.

---

## CHARTER — cold-start (read in order)

Agents starting any instance of this pattern: read **hive `ORCHESTRATION.md` first**, then:

1. **Instance `COMPOSER.md`** — main system guide for this product build-master  
2. **Instance `AGENTS.md`** — agent team orchestration / spawn rules  
3. **[`MASTER-BUILD-PATTERN.md`](./MASTER-BUILD-PATTERN.md)** — doctrine, red lines, roles, gates, Seed, CLOSEOUT, CP-0 policy  
4. **Instance `04-agent-ops/COORDINATION.md`** — worktrees, branches, PR / preview policy  
5. **Instance `03-audit/AUDIT-PROTOCOL.md`** — independent Check + report shape  
6. **Instance `00-MASTER-PLAN.md`** — locked decisions + product adapter (`workLogsRoot`, `historyRoot`, program status, CP-0 mode)  

Then: instance `WORKSTREAMS.md` (what’s open now) and the active unit’s PREP/READY/blueprint.

**Greenfield / new idea:** instance `04-agent-ops/PROGRAM-SEED.md` + `SEED-GUIDANCE.md` (before unit CP-0).  
**Automation / auto-spawn:** instance `04-agent-ops/CP0-POLICY.md` (with MASTER-PLAN CP-0 mode).  
**After a unit merges:** instance `04-agent-ops/CLOSEOUT.md` (not the build/PR path).

Orchestrator paste prompt: instance `04-agent-ops/MASTER-PREP-PROMPT.md` (from scaffold template).  
Seed paste prompt: instance `04-agent-ops/SEED-AGENT-PROMPT.md` (from scaffold template).

---

## Layout

| Path | What |
|---|---|
| [`MASTER-BUILD-PATTERN.md`](./MASTER-BUILD-PATTERN.md) | Doctrine v0.5.1 |
| [`INSTANCES.md`](./INSTANCES.md) | Registered build-master instances + `patternVersion` pins |
| [`scaffold/`](./scaffold/) | Copy this for a new product `_build-master` |
| [`../agent-team-pools/`](../agent-team-pools/) | **Agent Team Pool** pack — multi-domain pools + Research Brains (sibling under `hive/`) |

---

## Adopt in one line

```bash
cp -R ⟨lk-bloom⟩/hive/master-build/scaffold \
  /path/to/<product>_build-master
# then rename *.template, Seed-from-idea (or fill by hand),
# Admin program lock, set CP-0 mode, register hive/master-build/INSTANCES.md
```

### Agent team pools (org chart + Research Brains)

```bash
cp -R ⟨lk-bloom⟩/hive/agent-team-pools/scaffold \
  /path/to/<product>-master-dev-bot-pool
# rename *.template, Master Pool Lead + path map, Admin pool lock,
# register hive/agent-team-pools/INSTANCES.md
```

See [`../agent-team-pools/README.md`](../agent-team-pools/README.md). Does **not** replace WORKSTREAMS / BP unit loops.

---

## Authority boundaries

| Source | Use for |
|---|---|
| `BLOOM-PROTOCOL.md` v1.7 (+ companions) | Governance SOP |
| `lk-bloom/spec/` | Architectural pattern (cite status: Open vs Decided) |
| **`hive/`** ([`../ORCHESTRATION.md`](../ORCHESTRATION.md)) | Multiagent cold-start + hive registry |
| **This folder** (`scaffold/` + doctrine) | Agentic **build ops** pattern (unit loop) |
| [`../agent-team-pools/`](../agent-team-pools/) | Multi-domain **pool org chart** + Research Brains |
| Product instance MASTER-PLAN | Product walls / adapters / `workLogsRoot` / `historyRoot` / CP-0 mode |
| Instance COMPOSER + AGENTS | System guide + agent-team map for that product |

Dispatch Bloom suite carries a **thin pointer only** — no duplicate gates.
