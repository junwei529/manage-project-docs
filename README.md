# Project Docs

[简体中文](README.zh-CN.md)

Audits, adopts, maintains, and recovers project documentation without inventing authority.

This repository is the independent local product repository for `manage-project-docs`. Its
installable package is [`skills/manage-project-docs/`](skills/manage-project-docs/), preserved byte for
byte from source commit `80910a8b2375a11be897e9660c4b00a06d00dd13`.

## Repository contents

- Product package: [`skills/manage-project-docs/`](skills/manage-project-docs/)
- Product design and state: [`docs/skills/manage-project-docs/`](docs/skills/manage-project-docs/)
- Evaluation cases and fixtures: [`evals/`](evals/README.md)
- Standalone verification: [`scripts/check_repository.py`](scripts/check_repository.py)
- Source mapping: [`PROVENANCE.md`](PROVENANCE.md) and
  [`provenance/source-map.json`](provenance/source-map.json)

## Verify

```powershell
python -B scripts/check_repository.py --json
```

The repository has no implicit dependency on another Skill repository. Remote,
installation, tag, release, publication, and historical-continuity claims are
outside this migration snapshot.
