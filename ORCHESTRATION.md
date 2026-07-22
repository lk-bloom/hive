# Hive Orchestration — cold-start bible

**Audience:** every agent · every product · every role · any swarm size  
**Canonical home:** `lk-bloom/hive/`  
**Companion packs:** [`master-build/`](./master-build/) · [`agent-team-pools/`](./agent-team-pools/) · [`doctrine/`](./doctrine/)

---

## 0 · Universal agent guarantee

Any agent, dropped into any product build, at any role, at any swarm size, on a tiny docs unit or a multi-pool program, must be able to answer:

- Where am I?
- What am I allowed to do?
- What do I read next?
- What must I not invent?

**Same protocol everywhere.** Complexity scales by *how many* units / pools / digests — not by inventing a new process.

| Question | Answer |
|---|---|
| Any build type? | Same Seed → CP-0 → build → audit → preview → PR → CLOSEOUT → Learn |
| Any role? | Role card below + instance `AGENTS.md` (owns / must-not) |
| Any number of agents? | Same gates + CLOSEOUT leases + pool walls — more agents = more concurrent units, not a different protocol |
| Simple or complex? | One docs unit and a 100-agent program use this same cold-start |

**Success test:** A cold agent with only this file and the product build-master / pool instance paths can locate its role and next legal action without tribal knowledge.

---

## 0a · Master rule — local project boundary

**All bees · all products.**

1. **Default:** An agent may only read/write inside its **assigned local project folder** (product repo / worktree / declared build-master + pool paths for that product).
2. **Cross-hive exception:** Communicating with, or sharing files with, agents in **other** hive-network products/projects requires **explicit human-Admin gated approval** for that share (scope, paths, recipients, expiry).
3. **Not approval:** Reading canonical `lk-bloom/hive/` doctrine (cold-start cite-by-path) is always allowed — that is shared law, not a project data share.
4. **Must not:** copy secrets, dump another product’s tree, open worktrees outside the assigned project, or “helpfully” sync files across hives without Admin gate.

Record approved cross-hive shares in product `COORDINATION.md` (paths + purpose + recipients + expiry).

---

## 1 · Cold-start rule (every agent, every time)

1. Read **this file** (`hive/ORCHESTRATION.md`) — including **§0a local boundary**
2. Open the **product instance** `COMPOSER.md` → `AGENTS.md` (**bee roster** + assigned paths) → `COORDINATION.md` / `00-MASTER-PLAN.md` adapter (local walls)
3. Confirm **which bee you are** and your **local project boundary** (plus any Admin-approved cross-hive shares)
4. If **pool / insight** work: instance pool `REGISTRY.md` → your `pools/<id>/`
5. If **shipping** work: instance `WORKSTREAMS.md` → active unit PREP / READY / blueprint
6. **Stop claiming readiness** until role + walls + boundary + current unit/pool are clear

Do not skip to feature code. Do not invent a fourth job board. Do not cross projects without Admin gate.

---

## 2 · Three Blooms (do not blend)

Before applying any rule, name the altitude. Distill: [`distill/00-three-blooms-disambiguation.md`](./distill/00-three-blooms-disambiguation.md).

| Meaning | What | Where |
|---|---|---|
| #1 Governance SOP | Bloom Protocol law | dispatch `BLOOM-PROTOCOL.md` v1.7 |
| #2 Architectural pattern | Branching / cyclical / self-similar | `lk-bloom/spec/` (cite Open vs Decided) |
| #3 Cycle object | Spore → Seed → Sprout → Bloom product lifecycle | product / narrative surfaces |
| **Hive ops** | How agents ship and watch | **this folder** |

Hive sits at **ops + instance**: it does not fork the SOP and does not author Open architectural-spec Decided content.

---

## 3 · Altitude map (SoR)

| Layer | Owns | Lives |
|---|---|---|
| Governance SOP | Modularity / cycle / multi-agent law | dispatch Bloom suite |
| **Hive system** | Cold-start + registry + proposals | `lk-bloom/hive/` |
| Build ops | Seed → CLOSEOUT unit loop | `hive/master-build/` |
| Org / insight | Who watches, highlights, proposals | `hive/agent-team-pools/` |
| Code law | OOP / React ADRs | `hive/doctrine/` |
| Product job board | What ships next | product `_build-master` WORKSTREAMS / BP |
| Product walls | Fixture, preview, domain paths, UI catalog | product `COORDINATION.md` / MASTER-PLAN adapter |

**Hive never owns** product WORKSTREAMS status or product-specific walls.

---

## 4 · End-to-end loop (ship path)

```
Idea → Seed → Admin program lock → PREP / CP-0 → Build → Audit → Preview → PR → CLOSEOUT → Learn
```

| Stage | Owner | Key surfaces |
|---|---|---|
| Idea / Seed | Admin + Seed agent | `PROGRAM-SEED.md`, `SEED-GUIDANCE.md` |
| Program lock | Admin | MASTER-PLAN status `admin-locked` / `active` |
| PREP / CP-0 | Orchestrator (+ Admin if admin-gated) | `CP0-POLICY.md`, UNIT-PREP / READY |
| Build | Build agent | worktree from fresh `origin/main` |
| Audit | Audit agent (independent) | `AUDIT-PROTOCOL.md` |
| Preview | Admin | sandbox; handoff-ready ≠ PR-ready |
| PR / merge | Publisher | after preview approval |
| CLOSEOUT | Admin / Orchestrator | SoR + dual worklogs + history + leases |
| Learn | CLOSEOUT digest → pool Brains → optional hive proposals | insight only until Admin promotes |

Doctrine: [`master-build/MASTER-BUILD-PATTERN.md`](./master-build/MASTER-BUILD-PATTERN.md)  
Distill: [`distill/05-master-build-pattern.md`](./distill/05-master-build-pattern.md)

---

## 5 · Pool companion (watch / propose path)

```
REGISTRY → pools/<id> Brain → HIGHLIGHTS / PROPOSALS → INBOX → Admin promote → WORKSTREAMS
```

| Rule | Detail |
|---|---|
| Job board | WORKSTREAMS / BP only |
| Pool instance | Who watches / what was noticed — **not** a second queue |
| Promote | **Admin only** — see [`agent-team-pools/PROMOTE-TO-WORKSTREAMS.md`](./agent-team-pools/PROMOTE-TO-WORKSTREAMS.md) |
| Research | Cursor search tools for routine Brain work; never silent product OpenRouter spend |

Doctrine: [`agent-team-pools/POOL-PATTERN.md`](./agent-team-pools/POOL-PATTERN.md)

---

## 6 · Role map + bee roster (owns / must-not)

### Human Admin (governor)

**Human Admin** alone: program lock, pool lock, preview, merge authority, Brain→WORKSTREAMS promote, CP-0 mode, waivers, **cross-hive share gates**.

Agents never grant themselves these powers. “Admin agent” in casual speech means the **Executive-ops bee** (docs under human unlock) — not program governor. Full Admin-as-agent authority is **parked** — see [`registry/FUTURE-ADMIN-AGENT-LOCK.md`](./registry/FUTURE-ADMIN-AGENT-LOCK.md).

### Bee roster (required on every new build system)

Every new build-master / pool instance **must** ship a filled **bee roster** in instance `AGENTS.md` (and pool `TEAMS.md` where domains apply). Seed drafts it before program lock.

| Bee | Maintains | Must not |
|---|---|---|
| **Admin** (human) | Locks; preview; promote; merge; CP-0 mode; cross-hive gates | Leave preview to agents as substitute |
| **Seed** | Draft MASTER-PLAN, WORKSTREAMS, first BP, COMPOSER, AGENTS (incl. roster + paths) | Feature code; CP-0; worktrees; grant lock |
| **Executive-ops** | Executive docs, COMPOSER pointers, INSTANCES hygiene drafts, hive citation paths | Program lock; promote; preview; merge; cross-hive share without Admin |
| **Design** | `design-handoff/`, UI catalog slots, visual specs | Feature merge without audit/preview; expand walls alone; cross-hive share without Admin |
| **Research Brain** | HIGHLIGHTS; DIGESTS; PROPOSALS; escalate INBOX | Feature PRs; second job board; silent OpenRouter; cross-hive share without Admin |
| **Orchestrator** | Unit pick; CP-0 per policy; spawn; ledger; CLOSEOUT under Admin | Feature code; auto-CP-0 unless eligible; expand walls; cross-hive share without Admin |
| **Build** | Worktree implementation (local project only) | Self-audit; PR before preview; write outside assigned project |
| **Audit** | Independent Check; PASS / PASS-WITH-NOTES / FAIL | Commit to build branch; grant preview; pull foreign project trees without Admin |
| **Publisher** | PR after preview; attach audit; merge; hand off to CLOSEOUT | PR without preview approval; skip CLOSEOUT |
| **Master Pool Lead** | Fill/maintain pool instance map | Auto-promote; feature PRs; cross-hive share without Admin |

**Handoff-ready ≠ PR-ready ≠ closeout-done.**

Unit-loop roles also live in [`master-build/MASTER-BUILD-PATTERN.md`](./master-build/MASTER-BUILD-PATTERN.md) §3.

---

## 7 · Product adapters (what hive must never own)

Product instance `00-MASTER-PLAN.md` adapter holds:

- Hard walls (fixture-only, UI catalog, domain bounds, honesty vocabulary)
- `workLogsRoot`, `historyRoot`, primary checkout
- Program status, CP-0 mode (`admin-gated` default)

Missing local copies of `BLOOM-PROTOCOL.md` / `AGENT-COORDINATION.md` inside a product repo are OK when product `COORDINATION.md` cites the canon. Prefer cite-by-path over forking.

---

## 8 · Instantiation recipes

### New build-master (unit loop)

```bash
cp -R ⟨lk-bloom⟩/hive/master-build/scaffold \
  /path/to/<product>_build-master
# rename *.template → Seed-from-idea or fill by hand
# Admin program lock → register hive/master-build/INSTANCES.md
```

### New agent-team-pool (org chart)

```bash
cp -R ⟨lk-bloom⟩/hive/agent-team-pools/scaffold \
  /path/to/<product>-master-dev-bot-pool
# rename *.template; copy pools/_POOL.template → pools/<id>/
# Master Pool Lead + path map → Admin pool lock
# register hive/agent-team-pools/INSTANCES.md
```

Also add/update a row in [`registry/HIVE-MAP.md`](./registry/HIVE-MAP.md).

**Seed must also:** fill bee roster + declare assigned local project paths in `AGENTS.md` before Admin program lock (see §0a · §6).

---

## 9 · Instance upgrade checklist

1. Read changelog in the pack doctrine (MBP or pool pattern).
2. Pull new scaffold docs into the **instance** deliberately (do not silent-rewrite live rows).
3. Match local CLOSEOUT / COORDINATION / Seed surfaces to the tip you intend to pin.
4. Bump instance `patternVersion` / `poolPatternVersion` and the hive `INSTANCES.md` row.
5. Record date + notes; leave older smoke pins alone unless Admin upgrades them.

Legacy root paths (`lk-bloom/master-build/`, `lk-bloom/doctrine/`) are **frozen pointers**. New work edits **`hive/` only**. Product citations may re-pin to `hive/` when Admin chooses.

---

## 10 · Simple vs complex (same gates)

**Simple:** one Admin, one Seed draft, one Build, one Audit, docs-only preview waiver — still this bible.

**Complex:** many pools, many concurrent worktrees, Brain digests, Admin promotes, CLOSEOUT leases — still this bible + walls + leases.

---

## 11 · Quick links

| Need | Go |
|---|---|
| Unit-loop doctrine | [`master-build/MASTER-BUILD-PATTERN.md`](./master-build/MASTER-BUILD-PATTERN.md) |
| Pool doctrine | [`agent-team-pools/POOL-PATTERN.md`](./agent-team-pools/POOL-PATTERN.md) |
| Promote recipe | [`agent-team-pools/PROMOTE-TO-WORKSTREAMS.md`](./agent-team-pools/PROMOTE-TO-WORKSTREAMS.md) |
| Cross-pool exchange | [`agent-team-pools/IDEA-EXCHANGE.md`](./agent-team-pools/IDEA-EXCHANGE.md) |
| Hive upgrade inbox | [`proposals/README.md`](./proposals/README.md) |
| Scale vision | [`HIVE-ROADMAP.md`](./HIVE-ROADMAP.md) |
| OOP doctrine | [`doctrine/oop/README.md`](./doctrine/oop/README.md) |
| React doctrine | [`doctrine/react-universal/README.md`](./doctrine/react-universal/README.md) |
| Hive map | [`registry/HIVE-MAP.md`](./registry/HIVE-MAP.md) |
| Future Admin-agent (parked) | [`registry/FUTURE-ADMIN-AGENT-LOCK.md`](./registry/FUTURE-ADMIN-AGENT-LOCK.md) |
