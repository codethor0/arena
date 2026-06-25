#!/bin/bash
set -euo pipefail

AGENT_NAME="$1"
shift
LOG_FILE="$HOME/arena/logs/${AGENT_NAME}_$(date +%Y%m%d_%H%M%S).log"

mkdir -p "$(dirname "$LOG_FILE")"

echo "[ARENA] Starting $AGENT_NAME at $(date -Iseconds)" >> "$LOG_FILE"
echo "[ARENA] Command: $*" >> "$LOG_FILE"
echo "[ARENA] PID: $$" >> "$LOG_FILE"
echo "---" >> "$LOG_FILE"

"$@" >> "$LOG_FILE" 2>&1

echo "---" >> "$LOG_FILE"
echo "[ARENA] $AGENT_NAME exited at $(date -Iseconds)" >> "$LOG_FILE"
