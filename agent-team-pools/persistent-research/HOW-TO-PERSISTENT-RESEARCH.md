# How to use Persistent Research (Admin)

**Kit:** [`README.md`](./README.md) · **poolPatternVersion:** `0.3`  
**Not CP-0.** Research enablement is a **charter lock** + Admin phrases under the pool pack.

## Why this exists

Recurring Brain work needs bounds: what to watch, when to stop, how to pause, and where insight lands — without inventing a swarm daemon or burning product AI keys.

## Compounding insight (three layers)

| Layer | What | Who writes |
|---|---|---|
| Raw sources | Immutable docs, CLOSEOUT digests, curated URLs | Humans / ship loop — Brain **reads only** |
| Compiled insight | `HIGHLIGHTS`, dated `DIGESTS/`, `PROPOSALS`, optional pool `wiki/` + `RESEARCH-INDEX.md` | Research Brain (insight only) |
| Schema | Filled charter + Brain prompt | Admin (agents do not expand walls) |

Related reading (pattern cite, not a Hive dependency): [Karpathy LLM Wiki gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) — compile-once / keep-current markdown vs RAG rediscovery. Do **not** vendor that stack (Obsidian, qmd, Marp) into Hive.

## Enable (safe defaults)

1. Ensure the product pool instance is **pool-locked** (`REGISTRY` / `COMPOSER` active).
2. Copy into `pools/<pool-id>/` (or a subfolder you declare in the charter):
   - `RESEARCH-CHARTER.md` (from template)
   - `RUN-LOG.md` (from template)
   - Optionally keep a cite-by-path to hive `PERSISTENT-RESEARCH-BRAIN.md` instead of copying it
3. Fill charter: questions, allowed paths, do-not-touch, max iterations, session modes.
4. Admin: `lock research charter ⟨pool-id⟩` → status `admin-locked`.
5. Run validate:

```bash
./scripts/check-research-loop.sh \
  --charter /path/to/pools/<pool-id>/RESEARCH-CHARTER.md \
  --pool-root /path/to/pools/<pool-id>
```

6. Admin: `start research loop ⟨pool-id⟩` → status `active` (no `PAUSE` file).
7. Paste [`PERSISTENT-RESEARCH-BRAIN.md`](./PERSISTENT-RESEARCH-BRAIN.md) into a fresh agent session (fill placeholders from charter).
8. Review `INBOX.md` / `PROPOSALS.md`; promote only via [`../PROMOTE-TO-WORKSTREAMS.md`](../PROMOTE-TO-WORKSTREAMS.md).

## Pause / resume

- Pause: create `PAUSE` next to the charter (`pause research loop ⟨pool-id⟩`).
- Resume: remove `PAUSE`, then `start research loop ⟨pool-id⟩`.
- Validate script fails closed while `PAUSE` exists.

## Cost & grounding controls

- Max iterations per session is a **hard stop** in the Brain prompt.
- Soft budget notes in the charter (time / token awareness).
- Routine research: **Cursor search tools only**.
- Forbidden for this loop: OpenRouter, `UVRN_DASH_AI_KEY`, `DASH_PROVIDER=agent`, `DASH2_PROVIDER=agent`.
- `check-research-loop.sh --strict-env` (default **on**) fails if those env vars look set.

## External schedulers (optional, outside Hive)

cron or GitHub Actions may **open an agent session** that loads the Brain prompt after `check-research-loop.sh` PASSes.  
Do **not** add a Hive-embedded model runner, OpenRouter call, or unattended promote.

## Red lines

- No WORKSTREAMS / BP edits by the Brain
- No feature PRs, worktrees, or CP-0 from this kit
- Local project boundary + cross-hive Admin gate ([`../../ORCHESTRATION.md`](../../ORCHESTRATION.md) §0a)
- Insight until Admin promotes

## Smoke

See [`../instances/smoke-persistent-research/`](../instances/smoke-persistent-research/).
