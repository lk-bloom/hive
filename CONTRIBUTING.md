# Contributing to Hive

Hive is the public pattern home for Lyrikai multiagent ops. We welcome:

- Feedback on doctrine clarity and cold-start friction
- Bug reports on scaffolds or role-card ambiguity
- Pattern / doctrine upgrade proposals via [`proposals/`](./proposals/)

## How to propose a change

1. Copy [`proposals/PROPOSAL.template.md`](./proposals/PROPOSAL.template.md) → `proposals/YYYY-MM-DD-<slug>.md`
2. Link evidence (CLOSEOUT digests, audits, instance pain)
3. Suggest bump class: patch · minor · major
4. Leave status `open` until Steward acts

See [`proposals/README.md`](./proposals/README.md) for status values and acceptance flow.

## Stewardship

**Human Admin** (or designated Bloom Steward) accepts · parks · rejects.  
Agents and external contributors do **not** self-merge hive doctrine.

## Hard walls (OPSEC)

Before any contribution or dual-publish:

- No `registry/private/**`
- No absolute machine paths (`/Users/...`)
- No live product INSTANCES rows, tip SHAs, or private checkout pins
- No secrets, keys, tokens, `.env`, PEM

Policy: [`PUBLICATION.md`](./PUBLICATION.md).  
Publish guard: [`scripts/publish-public-tip.sh`](./scripts/publish-public-tip.sh) (dry-run default).
