# CP0-POLICY — unit start policy — Master Build Pattern v0.5

**Required.** Controls who may append ledger `started` (CP-0) and spawn a unit worktree.

Product adapter fills **CP-0 mode** + **system domain** in `00-MASTER-PLAN.md`.  
Doctrine: `lk-bloom/hive/master-build/MASTER-BUILD-PATTERN.md` §6b.

This file is the **rules surface** for future pure-automation tasks. It does **not** ship an always-on daemon.

---

## Modes

| Mode | When | Who CP-0s |
|---|---|---|
| `admin-gated` (**default**) | Human-paced products | Admin unlock phrase before each gated CP-0 |
| `automation-eligible` | Pure automation / in-domain continuous build | Orchestrator may auto-CP-0 when **all** circumstance checks PASS |

---

## Precondition (both modes)

- [ ] Program status is `admin-locked` or `active` (Seed complete; Admin already locked the program)  
- Seed program lock itself is **never** automatic  

---

## Circumstance checks (Required for `automation-eligible`)

Orchestrator may auto-CP-0 **only if every box PASSes**:

1. **Program locked** — status `admin-locked` or `active`  
2. **In domain** — unit file scope / WORKSTREAMS entry stays inside MASTER-PLAN system domain + hard walls (no wall expansion)  
3. **COORDINATION ok** — no conflicting active worktree for the same unit; slot free or multi-slot explicitly allowed  
4. **Blueprint ready** — BP (or Admin-approved auto-blueprint recipe) exists with acceptance criteria  
5. **Local safe defaults** — no live spend / secrets; LOCAL-SAFE-DEFAULTS respected  
6. **Downstream gates intact** — independent audit still Required; sandbox preview still Required before PR unless a documented waiver class applies  

Auto-CP-0 ≠ skip audit. Auto-CP-0 ≠ skip preview. Auto-CP-0 ≠ open PR.

---

## Still never automatic

- Admin **program lock** after Seed  
- Expanding hard walls / honesty vocabulary / spend caps  
- Starting units **outside** declared system domain  
- Opening PRs without preview (unless existing docs-only waiver)  
- Materializing secrets or live provider spend without Admin waiver class  

---

## Admin-gated behavior (default)

After CLOSEOUT (or before first unit):

- Park next unit in WORKSTREAMS / COORDINATION  
- Explicit **do not start**  
- No CP-0 until Admin unlock phrase (see COMPOSER § Admin phrases)  

---

## Automation-eligible behavior

When mode is set and circumstance checks PASS:

- Orchestrator may ledger `started`, add worktree, spawn Build (and later Audit) for the next **in-domain** unit  
- Record in ledger/COORDINATION that CP-0 was **auto** + which checks were evaluated  
- On any check FAIL → fall back to park / escalate to Admin (do not force)  

---

## Product adapter fields (MASTER-PLAN)

| Field | Example |
|---|---|
| CP-0 mode | `admin-gated` or `automation-eligible` |
| System domain | ⟨paths / packages / WS IDs in scope for auto-spawn⟩ |
| Unlock phrase (admin-gated) | ⟨e.g. `start BP-NN`⟩ |
| Multi-slot | ⟨yes/no — concurrent worktrees allowed?⟩ |
