# paperclip-api

Manage [Paperclip](https://github.com/paperclipai/paperclip) AI agent companies from Claude Code — create tasks, manage agents, approve hires, run heartbeats. No browser needed.

## What it does

Paperclip is an open-source orchestrator for autonomous AI agent companies. This skill gives you full control via CLI and REST API:

- **Issues** — create, assign, comment, update priority/status
- **Agents** — list, pause/resume, change model/prompt/budget, trigger heartbeat
- **Approvals** — list pending, approve/reject hires and strategies
- **Companies** — create, update budget, archive
- **Instructions** — edit agent prompts directly as markdown files

## Prerequisites

- [Paperclip](https://github.com/paperclipai/paperclip) running locally (`npx paperclipai onboard --yes`)
- Node.js 20+ and pnpm 9.15+

## Quick examples

```bash
# Create a task
pnpm paperclipai issue create --title "Audit SEO" --priority high

# List agents
pnpm paperclipai agent list

# Approve pending hires
pnpm paperclipai approval approve <id>

# Or use REST API directly
curl -X POST http://127.0.0.1:3101/api/companies/{companyId}/issues \
  -H "Content-Type: application/json" \
  -d '{"title": "Audit SEO", "priority": "high"}'
```

## Links

- [Paperclip Docs](https://docs.paperclip.ing)
- [API Overview](https://docs.paperclip.ing/api/overview)
- [CLI Commands](https://docs.paperclip.ing/cli/control-plane-commands)
