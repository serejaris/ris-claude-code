#!/bin/bash

# ANSI Colors
BLUE='\033[34m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
CYAN='\033[36m'
DIM='\033[2m'
RESET='\033[0m'

# Read JSON input from stdin
input=$(cat)

# Extract basic info from statusline JSON
current_dir="$(echo "$input" | jq -r '.workspace.current_dir')"
model="$(echo "$input" | jq -r '.model.display_name')"
dir_name="$(basename "$current_dir")"

# Extract context window data
total_input="$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')"
total_output="$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')"
context_size="$(echo "$input" | jq -r '.context_window.context_window_size // 0')"

# Calculate context usage percentage
context_pct=0
if [ "$context_size" != "0" ] && [ "$context_size" != "null" ]; then
    total_tokens=$((total_input + total_output))
    context_pct=$(echo "scale=0; ($total_tokens * 100) / $context_size" | bc 2>/dev/null || echo "0")
fi

# Get session data (these ARE available in statusline hook)
session_cost="$(echo "$input" | jq -r '.cost.total_cost_usd // 0')"
session_duration_ms="$(echo "$input" | jq -r '.cost.total_duration_ms // 0')"

# Get git branch if in a git repo
git_branch="$(cd "$current_dir" 2>/dev/null && git branch --show-current 2>/dev/null || echo '')"

# Function to format cost with dollar sign
format_cost() {
    local cost="$1"
    if [ "$cost" = "null" ] || [ -z "$cost" ] || [ "$cost" = "0" ]; then
        echo "\$0.00"
    else
        printf "\$%.2f" "$cost" 2>/dev/null || echo "\$0.00"
    fi
}

# Get usage data with proper date filtering
today_date=$(date +%Y%m%d)
today_cost=$(bun x ccusage daily --since "$today_date" --until "$today_date" --json 2>/dev/null | jq -r '.totals.totalCost' 2>/dev/null)
total_cost=$(bun x ccusage daily --since 20240101 --json 2>/dev/null | jq -r '.totals.totalCost' 2>/dev/null)

# Format the costs with colors
session_fmt="${GREEN}$(format_cost "$session_cost")${RESET}"
today_fmt="$(format_cost "$today_cost")"
total_fmt="${DIM}$(format_cost "$total_cost")${RESET}"

# Build usage info
usage_info="${session_fmt} • ${today_fmt} / ${total_fmt}"

# Format context usage percentage with color gradient
if [ "$context_pct" -lt 30 ]; then
    context_fmt="${GREEN}${context_pct}%${RESET}"
elif [ "$context_pct" -lt 60 ]; then
    context_fmt="${YELLOW}${context_pct}%${RESET}"
else
    context_fmt="${RED}${context_pct}%${RESET}"
fi

# Generate final status line with colors
if [ -n "$git_branch" ]; then
    printf "${BLUE}%s${RESET} ${DIM}(%s)${RESET} • ${CYAN}%s${RESET} • %b • %b" "$dir_name" "$git_branch" "$model" "$usage_info" "$context_fmt"
else
    printf "${BLUE}%s${RESET} • ${CYAN}%s${RESET} • %b • %b" "$dir_name" "$model" "$usage_info" "$context_fmt"
fi
