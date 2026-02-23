---
name: ceo-council
description: Use when needing strategic project analysis from multiple independent expert perspectives. Triggers on business decisions, growth strategy, product direction, competitive analysis, or any situation where diverse C-level opinions reduce blind spots
---

# CEO Council — Independent Strategic Analysis

Launch parallel sub-agents as isolated C-level experts. Each analyzes the same project data from their perspective. No coordination between experts — isolation produces genuine diversity of opinion. Then synthesize consensus and disagreements.

## Step 1: Scan Project Context

Before suggesting experts, understand the project:

1. Read `CLAUDE.md` (or `README.md` if absent)
2. Scan `.claude/rules/` for domain context
3. Glance at top-level file structure

Based on findings, **generate 4-6 expert roles tailored to THIS project**. Roles must reflect the project's actual domain, challenges, and stage.

## Step 2: Assemble the Council

Present generated roles to user via `AskUserQuestion` with `multiSelect: true`.

Prompt: "Who should join the council?" — show 4-6 options with short descriptions. User can pick "Other" to define custom roles.

**Minimum 2 experts.** If user picks 1, suggest adding at least one more for productive disagreement.

### Role Examples by Project Type

**Don't copy these** — generate fresh roles based on actual project context:

| Project Type | Typical Roles |
|-------------|--------------|
| **SaaS** | Head of Engineering, Head of Product, Head of Growth, CFO, UX Researcher |
| **Open Source** | Community Manager, Technical Architect, DevRel, Security Advisor |
| **Content / Media** | Content Strategist, Audience Analyst, Monetization Expert, Distribution Expert |
| **EdTech** | CMO, CFO, CPO, COO, Growth Advisor |
| **E-commerce** | Head of Supply Chain, Marketing Director, CTO, Customer Experience Lead |
| **Agency / Consulting** | Sales Director, Delivery Lead, Talent Manager, CFO |

## Step 3: Gather Current Data

Collect project state to feed all experts equally:

1. Key metrics/data files identified during context scan
2. Strategy and planning documents
3. Recent decisions or changes (git log, issues)
4. Previous council analyses (if any exist)

**All experts must receive identical data context.**

## Step 4: Generate Expert Prompts

For each selected expert, create a prompt:

```
You are the [ROLE] for [PROJECT NAME]. Analyze the data below from a [DOMAIN] perspective.

Focus on:
- [3-6 specific focus areas relevant to role and project]

Data:
[CURRENT PROJECT DATA]

[Role-specific instruction: "show the math", "be the contrarian", "prioritize by effort/impact", etc.]

Respond in the same language as the data provided.
```

**Rules:**
- Each expert gets the SAME data
- Focus areas must be specific to the project, not generic
- Include a personality instruction (contrarian, pragmatic, data-driven)
- Mention project constraints the expert should know

## Step 5: Execute

Launch selected experts as **parallel Opus sub-agents** using the Task tool with `subagent_type: "general-purpose"` and `model: "opus"`.

Each sub-agent runs independently. Wait for all to complete.

## Step 6: Synthesize

After all experts report, create a synthesis:

```markdown
# Council Session: [DATE]

## Council Members
[List of selected experts and their focus]

## Context
[Current metrics/state snapshot]

## [Expert 1 Name]
[Key findings and recommendations]

## [Expert 2 Name]
[Key findings and recommendations]

## Consensus (all agree)
1. ...
2. ...

## Disagreements
| Expert | Position | Argument |
|--------|----------|----------|
| ... | ... | ... |

## Decisions
_To be filled after discussion._
```

### Save Results

Save to a logical location:
- `docs/council-[DATE].md` — default
- Or project-specific path if context suggests one

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Generic roles not tied to project | Scan context first, tailor roles |
| Experts see different data | Always pass identical context |
| Too many experts (6+) | 3-4 is optimal for signal-to-noise |
| Skipping synthesis | The synthesis IS the value — don't skip |
| Running sequentially | Use parallel sub-agents for independence |
