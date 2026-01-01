# ris-claude-code

Collection of Claude Code customizations: skills, statusline, hooks.

## Critical Rules

**ALWAYS update BOTH READMEs when releasing:**
- README.md (English) and README.ru.md (Russian)
- Adding/removing skills → update skills list in both READMEs
- Adding/removing any component → update corresponding section in both READMEs
- Release without README updates = incomplete release

## Structure

| Path | Purpose |
|------|---------|
| `skills/` | Reusable skill templates |
| `statusline/` | Custom statusline scripts |
| `hooks/` | Pre/post command hooks |

## Skill Structure

Each skill folder must contain:
- `SKILL.md` — main skill file (required)
- `README.md` — English documentation
- `README.ru.md` — Russian documentation

Optional: additional templates, configs in the same folder.

## Versioning

| Change | Version | Example |
|--------|---------|---------|
| New skill/component | MINOR | 1.5.0 → 1.6.0 |
| Update existing skill | PATCH | 1.5.0 → 1.5.1 |
| Bug fix, docs | PATCH | 1.5.0 → 1.5.1 |

READMEs update only when skills list changes (add/remove).

## Release Checklist

1. Update CHANGELOG.md
2. Update READMEs (only if skills list changed)
3. Commit: `docs: update changelog for vX.Y.Z`
4. Tag: `git tag -a vX.Y.Z -m "Release vX.Y.Z"`
5. Push: `git push && git push --tags`
6. GitHub release via `gh release create`
