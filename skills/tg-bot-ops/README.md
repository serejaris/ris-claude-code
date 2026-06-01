# Telegram Bot Ops Skill

Operate Telegram bots and Telegram-to-agent gateways from an agent session: diagnose why a bot is not responding, verify webhook or polling setup, inspect logs, validate environment variables, run safe smoke tests, and prepare deploy or restart steps without exposing bot tokens.

A Telegram-to-agent gateway is a bot runtime where a Telegram update starts an
agent turn and the gateway sends the agent's answer back to Telegram. The
reusable evidence chain is: update delivered, runtime turn started, outbound
reply sent, reply visible in the target chat or topic.

## When To Use

- A Telegram bot stopped responding.
- A Telegram-to-agent gateway is not receiving or answering group/topic messages.
- You need to check webhook vs polling mode.
- Telegram updates are not reaching the runtime.
- A bot must reply in a group, channel, or forum topic.
- You need a safe restart or deploy plan.
- You need an incident summary with evidence and next steps.

## When Not To Use

- Writing channel posts or marketing copy.
- Building a new bot feature from scratch.
- Analyzing Telegram audience/content metrics.
- Sending production messages without explicit user authorization.

## Safety Model

The skill defaults to read-only diagnostics. It treats `TELEGRAM_BOT_TOKEN`, `.env` values, database URLs, raw logs, private DMs, payment payloads, session files, and user records as sensitive. Public reports should use placeholders such as `<TELEGRAM_BOT_TOKEN>`, `<CHAT_ID>`, and `<TOPIC_ID>`.

## Example Prompts

```text
My Telegram bot stopped responding. Diagnose it from this repo.
```

```text
Check whether this bot is using webhook or polling and verify the current setup.
```

```text
Review the last deploy logs and tell me why Telegram updates are failing.
```

```text
Prepare a safe restart plan for this Telegram bot on Railway.
```

```text
Run a smoke test using TELEGRAM_BOT_TOKEN from the local environment. Do not print the token.
```

## What It Checks

- bot repo, runtime, and deployment target;
- required environment variables without printing secret values;
- Bot API identity through `getMe` for Bot API-token runtimes;
- webhook state through `getWebhookInfo` for Bot API-token runtimes;
- session auth, connected client, update handler registration, and process logs
  for Telethon/MTProto runtimes;
- single update owner for Bot API polling mode;
- forum topic delivery with `message_thread_id`;
- privacy mode and group visibility constraints;
- Telegram-to-agent gateway routing from Telegram update to agent runtime and outbound reply;
- runtime logs and outbound send evidence;
- public-safe incident summary.

## Installation

```bash
cp -r skills/tg-bot-ops ~/.claude/skills/
```

## See Also

- [SKILL.md](SKILL.md) — full skill definition
- [references/hermes-gateway.md](references/hermes-gateway.md) — reusable Hermes-compatible gateway checklist
