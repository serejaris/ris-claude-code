#!/bin/bash
# Claude Code statusline with usage limits
input=$(cat)

# Extract from JSON
dir_name=$(echo "$input" | jq -r '.workspace.current_dir | split("/") | last // "?"')
model=$(echo "$input" | jq -r '.model.display_name // "?"')
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0')

# Git branch
cwd=$(echo "$input" | jq -r '.workspace.current_dir // "."')
branch=$(cd "$cwd" 2>/dev/null && git branch --show-current 2>/dev/null || echo "")

# Usage limits (cached, refresh every 2 min)
CACHE_FILE="/tmp/claude-usage-cache.json"
CACHE_TTL=120

fetch_usage() {
    TOKEN=$(security find-generic-password -s "Claude Code-credentials" -w 2>/dev/null | python3 -c "import sys,json; print(json.load(sys.stdin)['claudeAiOauth']['accessToken'])" 2>/dev/null)
    if [ -n "$TOKEN" ]; then
        curl -s "https://api.anthropic.com/api/oauth/usage" \
            -H "Authorization: Bearer $TOKEN" \
            -H "anthropic-beta: oauth-2025-04-20" \
            -H "Accept: application/json" 2>/dev/null
    fi
}

get_usage() {
    local now=$(date +%s)
    local cache_time=0

    if [ -f "$CACHE_FILE" ]; then
        cache_time=$(stat -f %m "$CACHE_FILE" 2>/dev/null || echo 0)
    fi

    if [ $((now - cache_time)) -gt $CACHE_TTL ]; then
        local data=$(fetch_usage)
        if [ -n "$data" ] && echo "$data" | jq -e '.five_hour' >/dev/null 2>&1; then
            echo "$data" > "$CACHE_FILE"
        fi
    fi

    if [ -f "$CACHE_FILE" ]; then
        cat "$CACHE_FILE"
    fi
}

# Get usage data
usage_data=$(get_usage)
five_h_left=""
week_left=""

if [ -n "$usage_data" ]; then
    five_h_used=$(echo "$usage_data" | jq -r '.five_hour.utilization // 0')
    week_used=$(echo "$usage_data" | jq -r '.seven_day.utilization // 0')
    five_h_reset=$(echo "$usage_data" | jq -r '.five_hour.resets_at // ""')

    five_h_left=$(python3 -c "print(int(100 - $five_h_used))" 2>/dev/null || echo "?")
    week_left=$(python3 -c "print(int(100 - $week_used))" 2>/dev/null || echo "?")

    # Time until reset
    if [ -n "$five_h_reset" ]; then
        time_left=$(python3 -c "
from datetime import datetime, timezone
reset = datetime.fromisoformat('$five_h_reset'.replace('Z', '+00:00'))
now = datetime.now(timezone.utc)
diff = reset - now
hours = int(diff.total_seconds() // 3600)
mins = int((diff.total_seconds() % 3600) // 60)
if hours > 0:
    print(f'{hours}h{mins}m')
else:
    print(f'{mins}m')
" 2>/dev/null || echo "")
    fi
fi

# Format cost
cost_fmt=$(printf "%.2f" "$cost" 2>/dev/null || echo "0.00")

# Colors for context %
if [ "$pct" -lt 50 ]; then
    pct_color="\033[32m"
elif [ "$pct" -lt 80 ]; then
    pct_color="\033[33m"
else
    pct_color="\033[31m"
fi

# Colors for usage limits
usage_color() {
    local val=$1
    if [ "$val" -gt 50 ]; then
        echo "\033[0m"   # white/default
    elif [ "$val" -gt 20 ]; then
        echo "\033[33m"  # yellow
    else
        echo "\033[31m"  # red
    fi
}

# Build output
out=""

# Dir and branch
if [ -n "$branch" ]; then
    out="\033[34m${dir_name}\033[0m \033[2m(${branch})\033[0m"
else
    out="\033[34m${dir_name}\033[0m"
fi

# Model
out="${out} • \033[36m${model}\033[0m"

# Usage limits
if [ -n "$five_h_left" ] && [ -n "$week_left" ]; then
    five_color=$(usage_color "$five_h_left")
    week_color=$(usage_color "$week_left")
    if [ -n "$time_left" ]; then
        out="${out} • ${five_color}${time_left} ${five_h_left}%\033[0m ${week_color}W${week_left}%\033[0m"
    else
        out="${out} • ${five_color}5h ${five_h_left}%\033[0m ${week_color}W${week_left}%\033[0m"
    fi
fi

# Cost and context
out="${out} • \033[32m\$${cost_fmt}\033[0m • ${pct_color}${pct}%\033[0m"

printf '%b' "$out"
