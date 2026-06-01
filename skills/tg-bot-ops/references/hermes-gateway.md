# Hermes-Compatible Telegram Gateway

Use this reference when a Telegram bot is a gateway into an AI agent runtime
rather than a single-purpose bot handler.

The public pattern is reusable. Replace all runtime-specific values with
placeholders:

| Private value | Public placeholder |
|---|---|
| real bot username | `<BOT_USERNAME>` |
| server hostname / SSH target | `<GATEWAY_HOST>` |
| systemd/service name | `<GATEWAY_SERVICE>` |
| gateway home directory | `<GATEWAY_HOME>` |
| chat id / topic id / user id | `<CHAT_ID>`, `<TOPIC_ID>`, `<USER_ID>` |
| token/env file path | `<ENV_PATH>` |
| raw log lines / prompts / DMs | `<REDACTED_LOG_EXCERPT>` |

## Evidence Chain

For a "gateway does not answer" incident, prove each layer separately:

1. Telegram delivered an update to the Bot API token or MTProto session/account.
2. The gateway process received the update.
3. Mention/command filters allowed the message.
4. The agent runtime started a turn with the expected context.
5. The runtime produced a response or failed with a concrete error.
6. The gateway sent the response to the intended chat and, for topics, the
   intended thread identifier.
7. The response is visible in the target Telegram surface.

## Group And Topic Intake

- Prefer explicit mention-gated group mode for shared groups.
- For command routers, test command syntax separately from plain mentions.
- For forum topics, preserve `message_thread_id` for non-General topics.
- For General topic, test without `message_thread_id` if Telegram returns
  `thread not found` or the runtime has a General-topic fallback.
- If BotFather privacy was disabled so the bot receives all group messages,
  remove and re-add the bot before treating the group visibility change as live.

## Safe Diagnostics

Use narrow nonces and redacted/summarized logs.

```bash
ssh <GATEWAY_HOST> 'systemctl --user status <GATEWAY_SERVICE> --no-pager'
```

If logs can include prompts, DMs, chat ids, user ids, payloads, or hostnames,
do not pull raw lines into the agent context. Query only the narrow nonce/status
fields, or summarize locally on the host before returning output. Public reports
must use placeholders:

```text
gateway inbound: yes
agent turn: started
outbound send: chat=<CHAT_ID>, thread=<TOPIC_ID>
visible reply: yes, timestamp=<TIMESTAMP>
```

## Repair Checklist

1. Confirm exact bot username, target chat, target topic, and sender.
2. Confirm gateway process owner and restart command.
3. Confirm env names exist without printing values.
4. Test command-style message first.
5. Test plain mention only after privacy/admin/re-add state is understood.
6. Restart only the named gateway service if authorized.
7. Run a final visible E2E in the same Telegram surface.

## Public Reporting

Report reusable facts, not private infrastructure:

```text
Status: verified in Telegram
Cause: privacy mode change required bot re-add before plain mentions reached the gateway
Evidence: raw update delivered, gateway inbound log, agent turn started, outbound reply visible in target topic
Boundary: host, token, chat id, and user data redacted
```
