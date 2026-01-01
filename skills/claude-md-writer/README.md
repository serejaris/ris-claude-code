# Claude MD Writer Skill

A Claude Code skill for creating and refactoring CLAUDE.md files following Anthropic best practices.

## Problem

CLAUDE.md files grow too large, waste tokens on every request, and lack organization for conditional loading.

## Solution

Enforces documentation standards:
- **Size limits** — CLAUDE.md < 200 lines, rules < 500 lines each
- **3-Tier System** — Foundation → Component → Feature documentation
- **Conditional loading** — `paths:` frontmatter for file-specific rules
- **Memory hierarchy** — proper priority understanding

## Installation

```bash
cp -r skills/claude-md-writer ~/.claude/skills/
```

## Quick Reference

| Limit | Target |
|-------|--------|
| CLAUDE.md | < 200 lines |
| Each rules file | < 500 lines |
| Critical rules | Top of file |

### 3-Tier System

| Tier | Location | Loads |
|------|----------|-------|
| Foundation | `CLAUDE.md` | Always |
| Component | `.claude/rules/` | When working in component |
| Feature | Co-located with code | When working on feature |

## Key Features

- Golden rules table with size limits
- 3-Tier documentation system
- Glob patterns for conditional rules
- Memory hierarchy explanation
- Quality checklist
- Common mistakes guide

## See Also

- [Memory docs](https://code.claude.com/docs/en/memory)
- [Best practices](https://anthropic.com/engineering/claude-code-best-practices)
- [Using CLAUDE.md](https://claude.com/blog/using-claude-md-files)
