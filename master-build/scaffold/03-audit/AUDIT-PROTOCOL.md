# 03 · Audit Protocol — Master Build Pattern v0.1

Every implementation unit gets an audit by a **separate agent** (never the build agent auditing itself) before handoff-ready. This is Bloom §2 Check, externalized.

**Audit ≠ PR gate alone.** After PASS / PASS-WITH-NOTES, the unit still requires **Admin sandbox preview approval** before any PR (unless Admin waived docs-only in writing). See `04-agent-ops/COORDINATION.md` and `04-agent-ops/PUBLISHER.md`.

## Procedure

1. Orchestrator spawns an audit agent with: the blueprint/unit file, this protocol, worktree path, read access to the product repo + this build-master.
2. Audit agent works **read-only** in the worktree (may run builds/tests; never commits to the build branch).
3. Verdict: **PASS** | **PASS-WITH-NOTES** | **FAIL**.
4. Report → `03-audit/reports/<UNIT>-audit-<n>.md`; ledger `audit-passed` | `audit-failed`.
5. Max **3** FAIL→fix cycles, then escalate to Admin.

## Universal checklist (plus the unit’s Audit focus)

**Scope + hygiene**
- [ ] Diff touches only declared file scope (+ explicitly allowed shared touchpoints).
- [ ] Product hard walls from `00-MASTER-PLAN.md` respected.
- [ ] No secrets / keys / env values in the diff.
- [ ] Local safe defaults respected for the verification run.

**Correctness**
- [ ] Acceptance boxes re-verified by auditor (not trusted from build notes).
- [ ] Tests for new logic pass; existing relevant tests pass.
- [ ] Any product “flag-off / zero-trace” or isolation proofs re-run if the unit touches them.

**Modularity (Bloom §3.1 — new modules)**
- [ ] Single responsibility · typed boundary · detachable · documented · independently verifiable · failure-isolated.

## Report template

```markdown
# Audit — <UNIT> <title> — attempt <n>
date: · auditor: · branch: · commit:
verdict: PASS | PASS-WITH-NOTES | FAIL
## Blocking findings (FAIL only)
- [file:line] finding + why it blocks
## Notes / nits
## Checks run
(commands + results)
## Acceptance re-verification
(each box: how verified)
## Bloom reflection
(one paragraph — what this unit teaches the next)
## Preview readiness
handoff-ready: yes/no · notes for Admin sandbox
```
