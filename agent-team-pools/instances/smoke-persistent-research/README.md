# Pool smoke — Persistent Research Kit (`smoke-persistent-research`)

**poolPatternVersion:** `0.3`  
**Status:** smoke — PASS 2026-07-22  
**Purpose:** Prove the opt-in Persistent Research Kit (charter, RUN-LOG, validate script) without a shipping product or model runner.

## Cold-start exercised

1. [`../../../ORCHESTRATION.md`](../../../ORCHESTRATION.md)  
2. [`../../POOL-PATTERN.md`](../../POOL-PATTERN.md) `0.3` §3a  
3. [`../../persistent-research/HOW-TO-PERSISTENT-RESEARCH.md`](../../persistent-research/HOW-TO-PERSISTENT-RESEARCH.md)  
4. Filled [`pools/smoke/RESEARCH-CHARTER.md`](./pools/smoke/RESEARCH-CHARTER.md) (`admin-locked`)  
5. `../../persistent-research/scripts/check-research-loop.sh --charter …` → PASS  

## Not exercised

- Live product path maps  
- OpenRouter / agent provider  
- CP-0 / worktrees / WORKSTREAMS writes  
- External cron/GHA (documented only)

## Result

Kit surfaces for pool pack `0.3` are present under `hive/agent-team-pools/persistent-research/`.  
Legacy [`../smoke-docs-only`](../smoke-docs-only/) remains pinned at `0.2`.
