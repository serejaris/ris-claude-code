---
name: api-digest
description: Use when user asks for digest, summary, or updates ("дайджест", "саммари", "что нового", "digest", "summary") - fetches raw data via API and generates detailed analysis
---

# API Data Digest

When triggered, fetch data from the API and generate a comprehensive digest.

## API Access

```bash
curl -s -H "Authorization: Bearer YOUR_TOKEN" "https://your-api.com/api/items?limit=500"
```

Replace with your actual endpoint. Common auth patterns:
- Bearer token: `-H "Authorization: Bearer TOKEN"`
- Basic auth: `-u "USER:PASS"`
- API key: `-H "X-API-Key: KEY"`

## Expected Response Format

The API should return JSON with an array of items:

```json
{
  "items": [
    {
      "id": "123",
      "text": "Message content here",
      "author": "username",
      "created_at": "2025-01-15T10:30:00Z"
    }
  ]
}
```

Adjust field names (`text`, `content`, `message`, `body`) based on your API.

## Output Format

Generate a digest with these sections:

### Required Sections
- **Period**: Date range covered
- **Volume**: Total items analyzed
- **Main Topics** (3-5): Key themes with brief descriptions
- **Notable Quotes**: Interesting statements with @author attribution
- **Key Decisions**: Any conclusions or agreements reached

### Optional Sections (include if relevant)
- **Useful Links**: URLs shared in the data
- **Open Questions**: Unresolved discussions
- **Active Contributors**: Top participants by volume/impact
- **Action Items**: Tasks or follow-ups mentioned

## Analysis Guidelines

1. **Be comprehensive** — this replaces backend LLM summaries, so extract more detail
2. **Preserve context** — don't strip nuance from quotes
3. **Identify patterns** — group related discussions into topics
4. **Note sentiment** — flag heated debates or consensus moments
5. **Extract value** — prioritize actionable info over noise

## Language

Output in the same language as the source data. If mixed, prefer the dominant language.
