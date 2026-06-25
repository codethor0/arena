#!/bin/bash
set -euo pipefail

RESULTS_FILE="$HOME/arena/results/verification_$(date +%Y%m%d_%H%M%S).txt"
mkdir -p "$(dirname "$RESULTS_FILE")"

echo "ARENA VERIFICATION REPORT" > "$RESULTS_FILE"
echo "Generated: $(date -Iseconds)" >> "$RESULTS_FILE"
echo "================================" >> "$RESULTS_FILE"

echo "" >> "$RESULTS_FILE"
echo "--- CLAUDE CODE STATUS ---" >> "$RESULTS_FILE"
if command -v claude &>/dev/null; then
    echo "BINARY: PRESENT at $(which claude)" >> "$RESULTS_FILE"
    claude --version >> "$RESULTS_FILE" 2>&1 || echo "VERSION: UNAVAILABLE" >> "$RESULTS_FILE"
else
    echo "BINARY: ABSENT" >> "$RESULTS_FILE"
fi

if [ -d "$HOME/.claude" ]; then
    echo "CONFIG_DIR: PRESENT ($HOME/.claude)" >> "$RESULTS_FILE"
    ls -la "$HOME/.claude" >> "$RESULTS_FILE"
else
    echo "CONFIG_DIR: ABSENT" >> "$RESULTS_FILE"
fi

if [ -f "$HOME/.claude.json" ]; then
    echo "CONFIG_FILE: PRESENT" >> "$RESULTS_FILE"
else
    echo "CONFIG_FILE: ABSENT" >> "$RESULTS_FILE"
fi

CLAUDE_PIDS=$(pgrep -f "claude" || true)
if [ -n "$CLAUDE_PIDS" ]; then
    echo "PROCESSES: RUNNING (PIDs: $CLAUDE_PIDS)" >> "$RESULTS_FILE"
else
    echo "PROCESSES: NONE" >> "$RESULTS_FILE"
fi

echo "" >> "$RESULTS_FILE"
echo "--- CODEX CLI STATUS ---" >> "$RESULTS_FILE"
if command -v codex &>/dev/null; then
    echo "BINARY: PRESENT at $(which codex)" >> "$RESULTS_FILE"
    codex --version >> "$RESULTS_FILE" 2>&1 || echo "VERSION: UNAVAILABLE" >> "$RESULTS_FILE"
else
    echo "BINARY: ABSENT" >> "$RESULTS_FILE"
fi

if [ -d "$HOME/.codex" ]; then
    echo "CONFIG_DIR: PRESENT ($HOME/.codex)" >> "$RESULTS_FILE"
    ls -la "$HOME/.codex" >> "$RESULTS_FILE"
else
    echo "CONFIG_DIR: ABSENT" >> "$RESULTS_FILE"
fi

if [ -d "$HOME/.config/codex" ]; then
    echo "CONFIG_DIR2: PRESENT ($HOME/.config/codex)" >> "$RESULTS_FILE"
else
    echo "CONFIG_DIR2: ABSENT" >> "$RESULTS_FILE"
fi

CODEX_PIDS=$(pgrep -f "codex" || true)
if [ -n "$CODEX_PIDS" ]; then
    echo "PROCESSES: RUNNING (PIDs: $CODEX_PIDS)" >> "$RESULTS_FILE"
else
    echo "PROCESSES: NONE" >> "$RESULTS_FILE"
fi

echo "" >> "$RESULTS_FILE"
echo "================================" >> "$RESULTS_FILE"
echo "VERIFICATION COMPLETE" >> "$RESULTS_FILE"

cat "$RESULTS_FILE"
