> **Hive cold-start:** prefer `lk-bloom/hive/ORCHESTRATION.md` for multiagent ops. This distill is meaning disambiguation only.

# Three Blooms — Disambiguation

> **Audience:** humans + agents
> **Status:** mature
> **Last updated:** 2026-05-10
> **Canonical source:** `lk-docs/systems/bloom-protocols_admin/`

## TL;DR

Three different things in the Lyrikai system are all called "bloom," and conflating them is the single biggest source of confusion in the corpus. Two are concrete and well-defined; one is a meta-pattern that has not yet been formally specified. **If you only read one gist in this set, read this one** — every other gist assumes you've read this first.

## What this is

The word **bloom** appears across `lk-docs/`, `dispatch/`, `lk-main/`, `lk-brain/`, and 182+ deployed copies of `BLOOM-PROTOCOL.md`. Reading those files in isolation, you'll encounter at least three distinct meanings without warning:

1. A specific governance document called **Bloom Protocol** (v1.7).
2. A larger architectural pattern that **Bloom Protocol** is allegedly an expression of.
3. A finished product artifact, also called **a bloom**, that comes out the end of the lifecycle.

These are not synonyms. They are three concepts that share a name. This gist names them, separates them, and gives you tools for spotting which one you're looking at.

## The three meanings

| # | Name | What it is | Status | Where it lives |
|---|---|---|---|---|
| 1 | **Bloom Protocol — Governance SOP** | The standard operating procedure for multi-agent parallel builds. Codifies how agents plan, build, check, update, reflect, continue. 12 sections plus 3 companion protocols. | **Mature, v1.7.** Deployed in 182+ places. | `dispatch/agent-doc-master/governance/bloom-protocol/BLOOM-PROTOCOL.md` |
| 2 | **Bloom Protocol — Architectural Pattern** | The larger living logic the governance SOP is allegedly an expression of: branching, cyclical, self-similar, maturational. Fractal symmetry is "one blossom" of *this*. | **Pre-spec.** Staged in the admin dir. Owner: Admin. | `lk-docs/systems/bloom-protocols_admin/` (prep, not the spec) |
| 3 | **Bloom — Lifecycle Cycle Object** | The fourth and final stage of a project's lifecycle (Spore → Seed → Sprout → **Bloom**). A sprout that has reached `registered` status and is publicly served at `/grove/<slug>/`. | **Operationally defined**, infrastructure decisions locked in ADRs 017–018. First real bloom not yet produced as of 2026-04-25. | `lk-docs/admin/BLOOM-PORTAL-PLAN-2026-04-17.md` and `lk-docs/admin/GROVE.md` |

Each gets its own full gist:
- **#1** → [`01-bloom-governance-protocol-suite.md`](./01-bloom-governance-protocol-suite.md)
- **#2** → [`02-bloom-architectural-pattern.md`](./02-bloom-architectural-pattern.md)
- **#3** → [`03-bloom-lifecycle-cycle-object.md`](./03-bloom-lifecycle-cycle-object.md)
- How they relate (without being conflated): [`04-bloom-cross-walk.md`](./04-bloom-cross-walk.md)

## How to tell which one is meant

When someone says "bloom" or "bloom protocol" in a doc, a Slack message, or an agent prompt, use these heuristics:

- **They cite a section number, version, or filename** (e.g., "Bloom v1.7 §6.5", "BLOOM-PROTOCOL.md", "the modularity table") → almost certainly **#1 (governance SOP)**. This is the most common case.
- **They use phrases like "one blossom of the bloom," "the larger bloom," "many leaves," "bloom is cyclical," "fractal expression"** → **#2 (architectural pattern)**. Watch for tone — this meaning is more conceptual and less actionable than #1.
- **They say "the sprout matured into a bloom," "registered bloom," "first bloom," "bloom portal," "/grove/<slug>"** → **#3 (cycle object)**. This is always about a specific deliverable artifact.
- **They mean two of these at once** — this happens. Stop and disambiguate before continuing. A mention of "bloom protocol shapes how blooms emerge" is collapsing #1 and #3, possibly via #2. Treat it as ambiguous.

If still unsure: **the speaker's own files give it away**. If they're working in `dispatch/agent-doc-master/`, they mean #1. If they're in `lk-docs/systems/bloom-protocols_admin/`, they mean #2. If they're in `lk-docs/admin/BLOOM-PORTAL-PLAN-*` or `lk-main/grove/`, they mean #3.

## Why this matters

The user's own prep workspace flags this as the #1 unblocker for writing the formal spec. From `lk-docs/systems/bloom-protocols_admin/2026-05-09-spec-scaffolding-questions.md`:

> **A3.** What is the relationship between "bloom protocol" and "blooms" (cycle objects)? The canonical loop names cycle objects: spores, seeds, sprouts, blooms. Is **bloom protocol** the protocol that governs how those objects mature? Or a different concept that happens to share the word "bloom"? Or both?

Both findings reports also lead with the disambiguation:

> "The word 'bloom' is used in two distinct, non-overlapping ways across the corpus. Every report in this folder separates them explicitly."  
> — [`macmini-findings/00-index.md`](lk-docs/systems/bloom-protocols_admin/global-system-findings/macmini-findings/00-index.md)

Those reports identified two meanings; this gist identifies a third — the architectural pattern that the prep dir is staging for, which sits *between* the governance doc and the cycle object as a higher-level meta-pattern. Once you see all three, the corpus reads cleanly.

## For agents

```
RULES — when "bloom" or "bloom protocol" appears in your scope:

1. Identify which of the three meanings is in play BEFORE reasoning further.
   Use the heuristics in "How to tell which one is meant" above.

2. If the source cites a section number, filename, or version (e.g. "v1.7 §6"),
   treat it as meaning #1 (governance SOP) and follow the rules in
   `01-bloom-governance-protocol-suite.md`.

3. If the source uses conceptual language (one blossom of, many leaves,
   cyclical, self-similar, maturational), treat it as meaning #2
   (architectural pattern) and follow the operating rule in
   `02-bloom-architectural-pattern.md` — DO NOT codify aspirational
   bloom language into agent contracts.

4. If the source describes a registered sprout, a portal route, or
   `/grove/<slug>/`, treat it as meaning #3 (cycle object) and follow
   the rules in `03-bloom-lifecycle-cycle-object.md`.

5. If a single statement appears to mean two of these at once, STOP.
   Either (a) ask the human author which is intended, or
   (b) flag the ambiguity in your output and proceed with the most
   conservative interpretation (usually #1).

6. Never invent a fourth meaning.
```

## See also

- [`01-bloom-governance-protocol-suite.md`](./01-bloom-governance-protocol-suite.md) — the mature governance protocol + companion suite
- [`02-bloom-architectural-pattern.md`](./02-bloom-architectural-pattern.md) — the pre-spec meta-pattern
- [`03-bloom-lifecycle-cycle-object.md`](./03-bloom-lifecycle-cycle-object.md) — the cycle object
- [`04-bloom-cross-walk.md`](./04-bloom-cross-walk.md) — how the three meanings relate without being conflated
- [`bloom-protocols_admin/README.md`](lk-docs/systems/bloom-protocols_admin/README.md) — the prep workspace's own orientation

## Sources

- [`bloom-protocols_admin/2026-05-09-spec-scaffolding-questions.md`](lk-docs/systems/bloom-protocols_admin/2026-05-09-spec-scaffolding-questions.md) — open question A3 (the explicit "are these the same word?" question)
- [`global-system-findings/macmini-findings/00-index.md`](lk-docs/systems/bloom-protocols_admin/global-system-findings/macmini-findings/00-index.md) — the "two definitions of bloom" callout in the lyrikai/ scan
- [`global-system-findings/documents-findings/00-index.md`](lk-docs/systems/bloom-protocols_admin/global-system-findings/documents-findings/00-index.md) — confirms the cycle-object meaning is absent from the `/Documents` corpus (14,672 files, zero instances), proving the two are filesystem-separated
- [`bloom-protocols_admin/2026-05-09-bloom-protocol-prep-notes.md`](lk-docs/systems/bloom-protocols_admin/2026-05-09-bloom-protocol-prep-notes.md) — Admin clarifications that surface the architectural-pattern meaning ("one blossom of the larger bloom"); the third meaning this gist names
