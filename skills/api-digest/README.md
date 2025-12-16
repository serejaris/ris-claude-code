# API Digest Skill

A Claude Code skill that fetches raw data from any API and generates detailed digests — without paying for backend LLM calls.

## Why This Exists

Instead of:
```
Backend → LLM API ($) → Short summary → User
```

This does:
```
Claude Code → Your API (free) → Detailed analysis → User
```

Claude processes raw data directly, giving you richer output at zero additional cost.

## Installation

1. Copy the skill folder to your Claude skills directory:

```bash
cp -r skills/api-digest ~/.claude/skills/
```

2. Edit `~/.claude/skills/api-digest/SKILL.md`:
   - Replace the curl command with your actual API endpoint
   - Add your authentication (token, basic auth, etc.)
   - Adjust field names to match your API response

3. Restart Claude Code or start a new session

## Configuration

### Authentication Examples

**Bearer Token:**
```bash
curl -s -H "Authorization: Bearer abc123" "https://api.example.com/messages"
```

**Basic Auth:**
```bash
curl -s -u "user:pass" "https://api.example.com/messages"
```

**API Key in Header:**
```bash
curl -s -H "X-API-Key: abc123" "https://api.example.com/messages"
```

### API Response Mapping

The skill expects JSON with items containing text and author. Common field variations:

| Expected | Alternatives |
|----------|-------------|
| `text` | `content`, `message`, `body` |
| `author` | `user`, `username`, `sender`, `from` |
| `created_at` | `timestamp`, `date`, `time` |

Update the SKILL.md instructions if your API uses different field names.

## Usage

Once installed, trigger with natural language:

- "дайджест" / "digest"
- "саммари" / "summary"
- "что нового" / "what's new"

Claude will:
1. Execute the curl command
2. Parse the response
3. Generate a structured digest

## Use Cases

- **Chat digests**: Telegram, Slack, Discord exports
- **Ticket summaries**: Jira, Linear, GitHub Issues
- **Log analysis**: Application logs, audit trails
- **Comment threads**: PR reviews, forum discussions
- **News feeds**: RSS aggregators, notification streams

## Security Notes

- Store credentials in the skill file (it's local to your machine)
- Don't commit configured skills with real credentials
- Use read-only API tokens when possible
