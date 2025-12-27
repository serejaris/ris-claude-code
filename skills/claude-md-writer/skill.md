---
name: claude-md-writer
description: Use when creating or refactoring CLAUDE.md files - enforces best practices for size, structure, and content organization
---

# CLAUDE.md Writer

Creates and refactors CLAUDE.md files following official Anthropic best practices (2025).

## Golden Rules

| Rule | Why |
|------|-----|
| **< 100 lines ideal, < 300 max** | Loads on EVERY request, costs tokens |
| **Critical rules FIRST** | Top = highest priority |
| **Modular rules → `.claude/rules/`** | Conditional loading, organized |
| **No linting rules** | Use ESLint/Prettier/Biome instead |
| **No code examples inline** | Reference files with `@path` |
| **Pointers over copies** | Files change, references stay valid |

## Memory Hierarchy

Claude Code loads memory in this order (later overrides earlier):

```
1. Enterprise    /Library/Application Support/ClaudeCode/CLAUDE.md
2. Project       ./CLAUDE.md or ./.claude/CLAUDE.md
3. Rules         ./.claude/rules/*.md (conditional)
4. User          ~/.claude/CLAUDE.md
5. Local         ./CLAUDE.local.md (gitignored, personal)
```

Use `/memory` command to see currently loaded files.

## Structure Template

```markdown
# Project Name

One-line description.

## Commands

- `npm run dev` - Development
- `npm run build` - Production
- `npm run test` - Tests

## Architecture

| Path | Purpose |
|------|---------|
| `lib/` | Core logic |
| `app/api/` | API routes |

## Key Patterns

**Pattern Name**: One-line explanation.

## Database (if applicable)

| Table | Key Fields |
|-------|------------|

## Modular Docs

See `.claude/rules/` for:
- `database.md` - queries, schema
- `deploy.md` - deployment

## Tech Stack

One line: Next.js 15, PostgreSQL, TypeScript
```

## Conditional Rules

Use YAML frontmatter for file-type-specific rules:

```markdown
---
paths: src/api/**/*.ts
---

# API Rules

- All endpoints must validate input
- Use standard error format
```

Rules with `paths:` only load when working in matching files.

## Workflow: New Project

1. Run `/init` for base CLAUDE.md
2. Review and trim generated content
3. Identify critical rules — what breaks if ignored?
4. Create `.claude/rules/` for domain-specific docs
5. Keep main file < 100 lines

## Workflow: Refactor Existing

1. **Count lines** — if > 300, must split
2. **Find task-specific content** — SQL, debugging, deploy → extract
3. **Create `.claude/rules/`**:
   - `database.md` - queries, schema, connection
   - `deploy.md` - deployment process
   - `messaging.md` - integrations (Telegram, etc.)
4. **Use `@file` references** — don't duplicate
5. **Keep in CLAUDE.md** — only what applies to EVERY task

## What Goes Where

| Content | Location |
|---------|----------|
| Project description | CLAUDE.md |
| Critical constraints | CLAUDE.md (top!) |
| Quick start (3 commands) | CLAUDE.md |
| Architecture overview | CLAUDE.md |
| Key patterns (1-liners) | CLAUDE.md |
| SQL queries/schema | `.claude/rules/database.md` |
| Deployment steps | `.claude/rules/deploy.md` |
| API documentation | `.claude/rules/api.md` |
| Git workflow | `.claude/rules/git.md` |
| Personal preferences | `CLAUDE.local.md` (gitignored) |
| Code style rules | `.eslintrc` / `biome.json` (NOT docs) |

## Import Syntax

Reference files instead of duplicating:

```markdown
@README.md
@docs/architecture.md
@~/.claude/snippets/common.md
```

- Relative: `@docs/file.md`
- Absolute: `@~/path/file.md`
- Max depth: 5 hops

## CLAUDE.local.md

Personal project settings (auto-gitignored):

```markdown
# My Local Settings

- Prefer verbose output
- Run tests after every change
- My worktree location: .trees/
```

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| 500+ lines | Split into `.claude/rules/` |
| SQL examples inline | → `rules/database.md` |
| "Run prettier" rules | Use tool config files |
| Full API docs | → `rules/api.md` |
| Deployment instructions | → `rules/deploy.md` |
| Code in CLAUDE.md | Use `@file:line` references |
| Negative rules only | Add alternatives: "Don't X; use Y instead" |

## Quality Checklist

Before finishing:

- [ ] < 100 lines? (< 300 acceptable)
- [ ] Critical rules at top?
- [ ] No task-specific content?
- [ ] No code style rules?
- [ ] `.claude/rules/` created for details?
- [ ] `@` references where possible?
- [ ] CLAUDE.local.md for personal prefs?
- [ ] Conditional rules use `paths:` frontmatter?

## Useful Commands

| Command | Purpose |
|---------|---------|
| `/init` | Generate initial CLAUDE.md |
| `/memory` | View loaded memory files |

## Sources

- anthropic.com/engineering/claude-code-best-practices
- code.claude.com/docs/en/memory
- HumanLayer: Writing a Good CLAUDE.md
- Arize: CLAUDE.md Best Practices from Prompt Learning
