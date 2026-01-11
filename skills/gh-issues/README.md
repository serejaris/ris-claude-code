# GitHub Issues CLI Skill

A Claude Code skill for efficient GitHub Issues management via `gh` CLI with AI session context storage.

## Problem

Managing GitHub issues through web UI is slow. AI assistants lose context between sessions, requiring repeated explanations.

## Solution

- Full `gh issue` CLI reference with JSON/jq patterns
- Bulk operations and advanced search filters
- **AI session context storage** — save/load work state in issue comments
- Task workflow with labels (backlog → in-progress → done)

## Installation

```bash
cp -r skills/gh-issues ~/.claude/skills/
```

## Quick Reference

### Essential Commands

| Task | Command |
|------|---------|
| Create issue | `gh issue create -t "Title" -b "Body" -l bug` |
| Active tasks | `gh issue list -l in-progress -s open` |
| View as JSON | `gh issue view 123 --json number,title,body` |
| Close with comment | `gh issue close 123 -c "Fixed in #456"` |
| Create branch | `gh issue develop 123 --checkout` |

### AI Context Workflow

```bash
# Save context to issue
gh issue comment 45 --body-file .ai-context.md

# Load context from issue
gh issue view 45 --json comments --jq '
  .comments[] | select(.body | contains("AI-CONTEXT")) | .body
'
```

### Task Labels

| Label | Meaning |
|-------|---------|
| `backlog` | In queue |
| `in-progress` | Active work |
| `blocked` | Blocked |
| `review` | Needs review |

## Key Features

- JSON output patterns for scripting
- Bulk operations (edit/close multiple issues)
- Issue → Branch → PR workflow
- AI session context templates
- Label-based task management

## See Also

- [GitHub CLI Documentation](https://cli.github.com/manual/)
- [Context Template](references/context-template.md)
