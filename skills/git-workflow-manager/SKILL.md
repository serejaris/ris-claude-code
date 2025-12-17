---
name: git-workflow-manager
description: Use when committing, releasing, or managing changelogs - enforces conventional commits, semantic versioning, and consistent release notes format
---

# Git Workflow Manager

## Overview

Enforces consistent git workflows: conventional commits, semantic versioning, changelog updates, and release notes format.

## Commit Convention

```
<type>: <description>
```

| Type | Description | Version Bump |
|------|-------------|--------------|
| `feat` | New feature | MINOR |
| `fix` | Bug fix | PATCH |
| `docs` | Documentation | — |
| `refactor` | Code change | — |
| `chore` | Maintenance | — |

Breaking change: `feat!:` or `fix!:` → MAJOR

## Version Bump Rules

```
Current: 1.2.3

feat:     → 1.3.0 (MINOR)
fix:      → 1.2.4 (PATCH)
feat!:    → 2.0.0 (MAJOR)
docs:     → no bump
```

## Workflow: Commit

```bash
# 1. Stage changes
git add .

# 2. Commit with conventional message
git commit -m "feat: add new feature"

# 3. For multi-line:
git commit -m "$(cat <<'EOF'
feat: add feature

Detailed description here.
EOF
)"
```

## Workflow: Release

```bash
# 1. Determine version bump from commits since last tag
git log $(git describe --tags --abbrev=0)..HEAD --oneline

# 2. Update CHANGELOG.md
# - Move [Unreleased] items to new version section
# - Add date: [1.3.0] - YYYY-MM-DD

# 3. Commit changelog
git add CHANGELOG.md
git commit -m "docs: update changelog for v1.3.0"

# 4. Create tag
git tag -a v1.3.0 -m "Release v1.3.0"

# 5. Push
git push && git push --tags

# 6. Create GitHub release
gh release create v1.3.0 \
  --title "v1.3.0 — Short Description" \
  --notes-file /tmp/release-notes.md
```

## Release Notes Template

```markdown
## What's New

### Feature Name
Brief description.

**Key points:**
- Point 1
- Point 2

### Installation (if applicable)
\`\`\`bash
command here
\`\`\`

---

**Full Changelog**: https://github.com/USER/REPO/compare/vPREV...vNEW
```

## CHANGELOG.md Format

```markdown
# Changelog

## [Unreleased]

## [1.3.0] - 2025-12-17
### Added
- Feature description

### Changed
- Change description

### Fixed
- Fix description

[Unreleased]: https://github.com/.../compare/v1.3.0...HEAD
[1.3.0]: https://github.com/.../compare/v1.2.0...v1.3.0
```

Sections: `Added`, `Changed`, `Deprecated`, `Removed`, `Fixed`, `Security`

## Quick Commands

| Task | Command |
|------|---------|
| Last tag | `git describe --tags --abbrev=0` |
| Commits since tag | `git log $(git describe --tags --abbrev=0)..HEAD --oneline` |
| Create release | `gh release create vX.Y.Z --title "vX.Y.Z — Title"` |
| Edit release | `gh release edit vX.Y.Z --title "New Title" --notes "..."` |
| List releases | `gh release list` |

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| No conventional prefix | Always use `feat:`, `fix:`, etc. |
| Forgot CHANGELOG | Update before tagging |
| Tag without release | Always `gh release create` after tag |
| Inconsistent title | Format: `vX.Y.Z — Short Description` |
| Missing comparison link | Add `**Full Changelog**: compare/...` |
