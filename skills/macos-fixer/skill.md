---
name: macos-fixer
description: Use when system feels sluggish, apps unresponsive, fans spinning, or user asks about memory/RAM/performance - diagnoses macOS memory and suggests fixes
---

# macOS Fixer

## Diagnostic Commands

Run in order, stop when problem found:

```bash
# 1. Quick overview (RAM, swap, pressure)
top -l 1 -s 0 | head -12

# 2. Memory pressure percentage
memory_pressure | grep "free percentage"

# 3. Swap details
sysctl vm.swapusage

# 4. Top memory consumers (MB)
ps -eo pid,rss,comm | sort -k2 -rn | head -15 | awk '{printf "%6d MB  %s\n", $2/1024, $3}'

# 5. VM statistics (compressions, pageouts)
vm_stat | grep -E "(Compressions|Decompressions|Swapins|Swapouts|compressor)"

# 6. Dev servers (common leaks)
lsof -i -P 2>/dev/null | grep node | grep LISTEN

# 7. Chrome tabs proxy
pgrep -l "Google Chrome" | wc -l
```

## Decision Tree

```
Memory pressure < 30%? ──yes──→ CRITICAL: close apps NOW
     │no
     ▼
Swap > 30% of RAM? ─────yes──→ RESTART RECOMMENDED
     │no
     ▼
High swap I/O? ─────────yes──→ MEMORY THRASHING: find the leak
     │no
     ▼
Uptime > 5 days? ───────yes──→ SCHEDULE RESTART
     │no
     ▼
Node process > 700MB? ──yes──→ Kill dev servers
     │no
     ▼
Chrome > 40 processes? ─yes──→ Close tabs or restart Chrome
     │no
     ▼
SYSTEM OK
```

## Quick Fixes

| Problem | Command |
|---------|---------|
| Kill Vite | `pkill -f "vite"` |
| Kill Next.js | `pkill -f "next-server"` |
| Clear FS cache | `sudo purge` |
| Restart Chrome | `pkill -x "Google Chrome" && open -a "Google Chrome"` |
| Restart Finder | `killall Finder` |
| Full restart | `sudo shutdown -r now` |

## Common Memory Hogs

| App | Typical | Leak Signs |
|-----|---------|------------|
| node (dev) | 200-400 MB | > 700 MB, multiple instances |
| Chrome | 50-100 MB/tab | > 40 processes |
| Electron apps | 200-400 MB | multiple renderer processes |
| VSCode | 300-600 MB | extensions bloat |

## Report Format

```
## Memory Status: [OK/WARNING/CRITICAL]

| Metric | Value | Status |
|--------|-------|--------|
| RAM used | X/Y GB | |
| Swap | X GB | |
| Pressure | X% free | |
| Uptime | X days | |

**Top Consumers:**
1. app: X MB
2. app: X MB
3. app: X MB

**Issues:** [list or "none"]
**Actions:** [numbered list or "none needed"]
```

## Misconceptions

| Myth | Reality |
|------|---------|
| "High used RAM = problem" | macOS caches aggressively; check pressure not usage |
| "Memory cleaner apps help" | They force cache purge, causing MORE disk I/O |
| "Swap = always bad" | Swap with green pressure = fine, system optimizing |
| "Compressor = problem" | Compressor is GOOD — saves RAM without disk I/O |
| "Free RAM should be high" | Unused RAM is wasted RAM; macOS uses it for cache |

## Preventive Measures

1. **Restart schedule**: Every 3-5 days, or when swap > 30% of RAM
2. **Dev cleanup**: Kill node servers after work session
3. **Chrome hygiene**: Use tab suspender extension, limit tabs
4. **Monitor pattern**: High swap I/O without high swap usage = leak resolved but residue remains → restart soon
