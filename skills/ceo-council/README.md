# CEO Council Skill

A Claude Code skill that launches parallel sub-agents as independent C-level experts to analyze your project from different strategic perspectives.

## Problem

When you ask an AI for strategic advice, you get one opinion — polished, structured, and without alternative viewpoints. Real strategic decisions benefit from multiple independent perspectives that can disagree.

## Solution

**CEO Council** spawns multiple Opus sub-agents, each role-playing a C-level expert (CFO, CPO, CTO, etc.). They analyze the same project data independently, then results are synthesized into consensus, disagreements, and actionable decisions.

## How It Works

```
1. Scan project context (CLAUDE.md, README, file structure)
2. Generate 4-6 expert roles tailored to the project
3. User picks who joins the council
4. Gather current project data
5. Launch parallel Opus sub-agents (each gets same data, different lens)
6. Synthesize: consensus + disagreements + decisions
```

## Council vs Agent Teams

| | Agent Teams | CEO Council |
|---|-----------|-------------|
| Purpose | Collaborative work | Independent opinions |
| Communication | Agents talk to each other | Agents work in isolation |
| Output | Coordinated deliverable | Diverse perspectives |
| Best for | Building features | Making decisions |

## Structure

```
ceo-council/
└── SKILL.md    # Main skill with full council workflow
```

## Installation

```bash
cp -r skills/ceo-council ~/.claude/skills/
```

## Requirements

- Claude Code with Task tool (sub-agents)
- Opus model recommended for expert quality

## Quick Start

```
Run a CEO council session for this project.
Focus on growth strategy for the next quarter.
```

Or be specific:

```
Assemble a council with CFO, CPO, and Growth Advisor.
Analyze our current metrics and recommend priorities.
```

## Example Output

```markdown
# Council Session: 2026-02-23

## Consensus (all agree)
1. Current pricing leaves money on the table
2. Onboarding flow needs simplification

## Disagreements
| Expert | Position | Argument |
|--------|----------|----------|
| CFO | Raise prices now | Unit economics unsustainable at current rate |
| CPO | Add value first | Price increase without product improvement causes churn |

## Decisions
_To be filled after discussion._
```

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Generic roles not tied to project | Scan context first, tailor roles |
| Experts see different data | Always pass identical context |
| Too many experts (6+) | 3-4 is optimal for signal-to-noise |
| Skipping synthesis | The synthesis IS the value |

## Background

The council pattern is based on the idea that multiple independent opinions produce better decisions than a single comprehensive analysis. Like doctors at a medical council — each examines the same patient but sees different things.

Read more: [Three agents found different problems in the same project](https://sereja.tech/blog/agent-consilium-independent-opinions/) (Russian)

## See Also

- [Agent Teams Skill](../agent-teams/) — for collaborative work (shared state, coordination)
- [Building Multi-Agent Systems (Anthropic Blog)](https://www.anthropic.com/engineering/building-effective-agents)
