# Project Docs Verification

## Accepted migration baseline

- Source commit: `80910a8b2375a11be897e9660c4b00a06d00dd13`
- Package path: `skills/manage-project-docs/`
- Package files: 6
- Provenance manifest: [`../../../provenance/source-map.json`](../../../provenance/source-map.json)

## Repository check

```powershell
python -B scripts/check_repository.py --json
```

This verifies exact Git-blob identity for package/case/fixture/license inputs,
the adapted-file hashes and source mappings, expected package and evaluation
shape, UTF-8/BOM and Markdown-link boundaries, and publication safety.

## Focused check

The repository checker covers the retained deterministic cases and fixtures.

## Evidence limits

Fresh native selection, installed-copy behavior, publication, and broad efficacy are not established by this migration. A local clean commit and native review prove only this
standalone migration checkpoint; they do not authorize or prove publication,
installation, a remote, tag, Release, or broad product efficacy.
