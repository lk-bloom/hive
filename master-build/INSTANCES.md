# Master Build Pattern — Instances (public)

**patternVersion at canonical:** `0.5.1`  
**Doctrine:** [`MASTER-BUILD-PATTERN.md`](./MASTER-BUILD-PATTERN.md)

Public tip lists **smoke / docs-only** examples only.  
Live product registries (paths, private repos, tip SHAs) stay off this public surface — see local `registry/private/` on Admin machines (not published).

| ID | Product / team | Path | patternVersion | Status | Notes |
|---|---|---|---|---|---|
| **smoke** | scaffold smoke (docs-only) | `instances/smoke-docs-only` | `0.2` | smoke — PASS 2026-07-15 | Legacy CLOSEOUT smoke; leave pin |
| **smoke-hive-0_5** | hive tip smoke (docs-only) | `instances/smoke-hive-0_5` | `0.5` | smoke — PASS 2026-07-22 | Tip CLOSEOUT + Brain digest surfaces |

## How to register (private)

1. Copy `scaffold/` to your product build-master path.  
2. Fill templates + Admin program lock.  
3. Record the live row in your **private** instance ledger (not in this public file).  
4. Pin `patternVersion` deliberately when upgrading.

## Related

- Pool smokes: [`../agent-team-pools/INSTANCES.md`](../agent-team-pools/INSTANCES.md)  
- Publication policy: [`../PUBLICATION.md`](../PUBLICATION.md)  
