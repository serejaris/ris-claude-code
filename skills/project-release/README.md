# Project Release Skill

A Claude Code skill for releasing ris-claude-code with semantic versioning and consistent workflow.

## Problem

Release process is error-prone: forgetting changelog updates, wrong version bumps, missing tags, inconsistent release notes.

## Solution

Enforces release standards:
- **Semantic versioning** — MINOR for new skills, PATCH for updates
- **Pre-release checklist** — verify all requirements before release
- **Files decision matrix** — know exactly what to update
- **Post-release verification** — confirm release succeeded

## Installation

```bash
cp -r skills/project-release ~/.claude/skills/
```

## Quick Reference

| Change Type | Version Bump |
|-------------|--------------|
| New skill/component | MINOR (1.5.0 → 1.6.0) |
| Update existing | PATCH (1.5.0 → 1.5.1) |
| Bug fix, docs | PATCH (1.5.0 → 1.5.1) |

## Key Features

- Pre-release validation checklist
- Version determination rules
- Files update decision matrix
- Step-by-step release workflow
- GitHub release template
- Post-release verification
- Common mistakes guide

## See Also

- [Keep a Changelog](https://keepachangelog.com/)
- [Semantic Versioning](https://semver.org/)
- [Conventional Commits](https://www.conventionalcommits.org/)
