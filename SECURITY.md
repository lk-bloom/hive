# Security Policy

Hive is a **documentation and pattern library** (scaffolds, doctrine, orchestration docs). It does not ship a networked runtime, daemon, or service by default.

## Supported versions

The public tip at [lk-bloom/hive](https://github.com/lk-bloom/hive) is the supported surface. Pattern pack versions are pinned in the root [`README.md`](./README.md) (Master Build Pattern, Agent Team Pools).

## Reporting a vulnerability

If you find a security concern in this repository — for example secrets accidentally committed, absolute private paths in the public tree, or publish-guard bypasses — please report it privately to the maintainers via the Steward path in [`CONTRIBUTING.md`](./CONTRIBUTING.md) (Human Admin / Bloom Steward). Do **not** open a public issue that includes leaked secrets or private paths.

We will acknowledge reports and remediate on the public tip (including history rewrite if a leak landed — Admin-ordered only). There is no formal SLA; this is a patterns repo, not a product runtime.

## Safe contribution reminders

- Never commit secrets, keys, tokens, `.env`, or PEM files
- Never publish `registry/private/**` or live product INSTANCES rows
- Run [`scripts/publish-public-tip.sh`](./scripts/publish-public-tip.sh) (dry-run default) before syncing the public tip

See [`PUBLICATION.md`](./PUBLICATION.md) for the full public vs private policy.
