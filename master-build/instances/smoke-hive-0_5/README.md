# MBP smoke — hive tip (`smoke-hive-0_5`)

**patternVersion:** `0.5`  
**Status:** smoke — PASS 2026-07-22  
**Purpose:** Prove hive Master Build tip surfaces: Seed/COMPOSER/CP0 docs, CLOSEOUT Brain digest step, without shipping product code.

## Cold-start exercised

1. [`../../ORCHESTRATION.md`](../../ORCHESTRATION.md)  
2. [`../MASTER-BUILD-PATTERN.md`](../MASTER-BUILD-PATTERN.md) `0.5`  
3. Scaffold `04-agent-ops/CLOSEOUT.md` step 4a  
4. Scaffold `04-agent-ops/BRAIN-DIGEST.md.template`  
5. Pointer to pool smoke digest under `../../agent-team-pools/instances/smoke-docs-only/`

## Legacy smoke

`instances/smoke-docs-only` remains pinned at **`0.2`** (CLOSEOUT-era smoke). Do not silent-upgrade it.

## Result

Tip `0.5` CLOSEOUT + Brain digest template exist under `hive/master-build/scaffold/`. Live product instances stay on their pins until Admin upgrades.
