# Agent Teams Skill

A Claude Code skill for orchestrating multiple autonomous agents with shared task lists and direct inter-agent communication.

## Problem

Complex tasks often require parallel work across different domains (frontend + backend, security + performance review). Single agents or simple subagents can't coordinate — they work in isolation without shared state or messaging.

## Solution

Use Claude Code **Agent Teams** — spawn teammates that share a task list, communicate via direct messages, and self-coordinate work.

## Structure

```
agent-teams/
└── SKILL.md    # Main skill with lifecycle, patterns, and best practices
```

## Installation

```bash
cp -r skills/agent-teams ~/.claude/skills/
```

## Requirements

- Claude Code with Agent Teams enabled
- Enable in `~/.claude/settings.json`:
  ```json
  { "env": { "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1" } }
  ```

## Quick Start

Tell Claude what you need:

```
Create a team for reviewing PR #42:
- Security reviewer for auth module
- Performance reviewer for database queries
- Test coverage reviewer
```

Or use the tools directly:

```
1. Teammate(operation="spawnTeam", team_name="review")
2. TaskCreate(subject="Review auth security", ...)
3. Task(subagent_type="general-purpose", team_name="review", name="security-rev", ...)
4. TaskUpdate(taskId="1", owner="security-rev")
```

## Key Concepts

| Concept | Description |
|---------|-------------|
| **Team** | Group of agents with shared task list |
| **Teammate** | Autonomous agent with its own context |
| **Task List** | Shared across all team members |
| **SendMessage** | Direct messaging between agents |
| **Idle state** | Normal — teammate waiting for input, not an error |

## Teams vs Subagents

| | Subagents | Teams |
|---|-----------|-------|
| Communication | Only back to caller | Agents message each other |
| Coordination | Caller manages | Shared task list |
| Cost | Lower | Higher |
| Best for | Focused tasks | Collaboration |

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Two agents editing same file | Partition file ownership explicitly |
| Sparse spawn prompts | Include full context — teammates don't inherit history |
| Broadcasting routine updates | Use direct message to specific teammate |
| Too many teammates | 2-4 optimal, more adds coordination overhead |

## Use Cases

- Multi-reviewer code review (security, performance, tests in parallel)
- Cross-layer feature work (frontend + backend + tests)
- Research with competing hypotheses sharing findings
- Large refactoring with separate module ownership

## See Also

- [Claude Code Agent Teams Documentation](https://code.claude.com/docs/en/agent-teams)
- [Building Multi-Agent Systems (Anthropic Blog)](https://www.anthropic.com/engineering/building-effective-agents)
