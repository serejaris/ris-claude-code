# Git Workflow Manager Skill

A Claude Code skill for consistent git workflows — conventional commits, semantic versioning, changelog management, and release notes.

## Problem

Inconsistent commit messages, arbitrary version bumps, and varying release note formats make project history hard to navigate and automate.

## Solution

Enforces standardized workflows:
- **Conventional Commits** — structured commit messages
- **Semantic Versioning** — predictable version bumps
- **Keep a Changelog** — consistent changelog format
- **Release Notes** — uniform GitHub release format

## Installation

```bash
cp -r skills/git-workflow-manager ~/.claude/skills/
```

## Quick Reference

### Commit Types

| Type | Description | Version Bump |
|------|-------------|--------------|
| `feat:` | New feature | MINOR (1.x.0) |
| `fix:` | Bug fix | PATCH (1.0.x) |
| `feat!:` | Breaking change | MAJOR (x.0.0) |
| `docs:` | Documentation | — |
| `refactor:` | Code change | — |
| `chore:` | Maintenance | — |

### Release Workflow

```bash
# 1. Check commits since last release
git log $(git describe --tags --abbrev=0)..HEAD --oneline

# 2. Update CHANGELOG.md

# 3. Commit, tag, push
git add CHANGELOG.md
git commit -m "docs: update changelog for v1.3.0"
git tag -a v1.3.0 -m "Release v1.3.0"
git push && git push --tags

# 4. Create GitHub release
gh release create v1.3.0 --title "v1.3.0 — Feature Name"
```

### Release Title Format

```
v1.3.0 — Short Description
```

## Key Features

- Commit message validation
- Automatic version bump calculation
- CHANGELOG.md template
- Release notes template
- GitHub release commands

## See Also

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [Keep a Changelog](https://keepachangelog.com/)
