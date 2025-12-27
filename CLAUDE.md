# ris-claude-code

Collection of Claude Code customizations: skills, statusline, hooks.

## Critical Rules

**ALWAYS update README.md when releasing:**
- Adding/removing skills → update skills list in README.md
- Adding/removing any component → update corresponding section in README.md
- Release without README update = incomplete release

## Structure

| Path | Purpose |
|------|---------|
| `skills/` | Reusable skill templates |
| `statusline/` | Custom statusline scripts |
| `hooks/` | Pre/post command hooks |

## Release Checklist

1. Update CHANGELOG.md
2. Update README.md (skills list, components)
3. Commit with conventional message
4. Tag with semver
5. Push and create GitHub release
