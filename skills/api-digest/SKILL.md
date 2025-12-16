---
name: api-digest
description: Use when user asks for digest ("дайджест", "саммари", "что нового", "digest", "summary") - fetches data via API and generates detailed analysis
---

# API Data Digest

Generate detailed digest from your API.

## API Access

Run [fetch.sh](fetch.sh) to get data:

```bash
./fetch.sh
```

## Output Format

Use template from [output-template.md](output-template.md).

## What to Extract

- **Topics**: tools, discussions, problems, recommendations
- **Quotes**: funny, insightful, emotional with @username
- **Links**: grep http/https in content
- **Questions**: unanswered
- **Contributors**: most active authors

## Analysis Guidelines

1. Be comprehensive — extract more detail than a typical summary
2. Preserve context — don't strip nuance from quotes
3. Identify patterns — group related discussions into topics
4. Note sentiment — flag heated debates or consensus moments
5. Extract value — prioritize actionable info over noise

## Language

Output in the same language as the source data.
