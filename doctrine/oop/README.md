# Lyrikai OOP Doctrine

**Status:** v0.1 seed · 2026-07-16 · pending Admin review
**Scope:** every Lyrikai/Suttle Media repo — UVRN (packages, worker, website/dash2, expo), LK production, future blooms
**Derived from:** UVRN dash2 OOP study pack + 2026-07-16 three-repo alignment audit (`uvrn-executive/2026-07_OOP-remediation-workstreams/00-SOURCE-AUDIT-REPORT.md`)

## What this is

The house engineering style for how Lyrikai code is shaped: when to use objects, when to use functions, how contracts are named and enforced, and how drift gets caught. It lives in lk-bloom because it is governance, not implementation — the same reason the Bloom Protocol lives here. Agents and humans cite these docs in PR reviews and plans by ADR number.

## What this is not

Not a repo map. Repo-specific study packs (e.g. `uvrn-executive/dash2_OOP-architecture/`) stay next to their repos and cite this doctrine; this doctrine cites them as worked examples.

## Reading order

| Doc | Role |
|-----|------|
| [00-HOUSE-STYLE.md](00-HOUSE-STYLE.md) | The paradigm contract — composition-first OOP rules |
| [01-DECISIONS.md](01-DECISIONS.md) | ADR register — locked decisions, citable as ADR-001… |
| [02-CONTRACTS-FIRST.md](02-CONTRACTS-FIRST.md) | Ports, boundaries, validation, versioning discipline |
| [03-TRIPWIRES.md](03-TRIPWIRES.md) | Drift detection — what to measure, per-repo baselines |

## One-paragraph summary

Lyrikai code is **composition-first**: a functional core of pure, deterministic transformations over immutable data, with classes permitted only where an instance truly owns a resource or lifecycle with enforceable private state. Interfaces are structural and named (ports), dependencies are injected through factory arguments from a composition root, inheritance is effectively banned, and every trust boundary validates at runtime. The audit found all three production UVRN repos already converge on this style organically — this doctrine makes it official so it survives growth, agents, and new repos.
