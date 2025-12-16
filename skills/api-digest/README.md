# API Digest Skill

A Claude Code skill that fetches raw data from any API and generates detailed digests — without paying for backend LLM calls.

## Structure

```
api-digest/
├── SKILL.md            # Instructions with links to other files
├── fetch.sh            # Curl with credentials (isolated)
└── output-template.md  # Output format template
```

**Why split?**
- **Progressive disclosure** — Claude loads additional files only when needed
- **Security** — credentials isolated in separate file
- **Reusability** — output template can be changed independently

## Installation

```bash
cp -r skills/api-digest ~/.claude/skills/
chmod +x ~/.claude/skills/api-digest/fetch.sh
```

## Configuration

### 1. Edit `fetch.sh`

Replace placeholders with your values:

```bash
API_URL="https://your-api.com"
RESOURCE_ID="123"
USER="your-username"
PASS="your-password"
LIMIT=400
```

**Auth alternatives:**

```bash
# Bearer token
curl -s -H "Authorization: Bearer $TOKEN" "$API_URL/items"

# API key
curl -s -H "X-API-Key: $KEY" "$API_URL/items"
```

### 2. Customize triggers (optional)

Edit description in `SKILL.md` to change trigger words:

```yaml
description: Use when user asks for digest ("дайджест", "my-trigger-word")
```

### 3. Modify output template (optional)

Edit `output-template.md` to match your needs.

## Usage

After installation, trigger with:
- "дайджест" / "digest"
- "саммари" / "summary"
- "что нового" / "what's new"

## Use Cases

- **Chat digests**: Telegram, Slack, Discord
- **Ticket summaries**: Jira, Linear, GitHub Issues
- **Log analysis**: Application logs, audit trails
- **Comment threads**: PR reviews, forums

## Security

- Credentials stay local in `fetch.sh`
- Don't commit configured skills with real credentials
- Use read-only API tokens when possible
