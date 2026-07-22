# Publisher checklist — Master Build Pattern v0.2

**Required.** Publisher owns publish after Admin sandbox preview through **merge**. Build/orchestrator stop at handoff-ready.

**Handoff-ready ≠ PR-ready ≠ closeout-done.**  
After merge, run **`CLOSEOUT.md`** — do not treat this publisher checklist as full SoR/worklog/next-pointer closeout.

## Before opening a PR

- [ ] Audit verdict PASS or PASS-WITH-NOTES; report path known  
- [ ] Admin preview approved (date + who) **or** docs-only waiver on record  
- [ ] Branch rebased / current on `origin/main` as policy requires  
- [ ] Acceptance still true after rebase (re-run checks if conflicts)  
- [ ] No secrets in the diff  

## Open PR

- [ ] Push with `-u` if needed  
- [ ] Title: `⟨product⟩ ⟨UNIT⟩ · ⟨title⟩`  
- [ ] Description includes: unit link, acceptance + how, Bloom self-assessment, audit path, **preview-approved** line  
- [ ] Ledger: `pr-opened`  

## Merge

- [ ] Merge only after audit + preview gates (prefer squash)  
- [ ] Delete remote branch  
- [ ] Record merge SHA for CLOSEOUT  
- [ ] Hand off to **`CLOSEOUT.md`** (ledger `merged`/`reflect`, worklogs, prune, ff-pull, next pointer live there)

## Do not

- Open a PR on audit PASS alone  
- Merge FAIL / unaudited / un-previewed  
- Push directly to `main`  
- Skip CLOSEOUT after land  
- Start the next gated unit unless Admin says **start …**  
