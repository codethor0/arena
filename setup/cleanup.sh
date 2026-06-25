#!/bin/bash
set -euo pipefail

echo "[ARENA] Cleaning up..."

pkill -f claude || true
pkill -f codex || true
pkill -f node || true

npm uninstall -g @openai/codex 2>/dev/null || true
rm -rf /usr/local/bin/claude 2>/dev/null || true
rm -rf "$HOME/.claude" 2>/dev/null || true
rm -rf "$HOME/.claude.json" 2>/dev/null || true
rm -rf "$HOME/.codex" 2>/dev/null || true
rm -rf "$HOME/.config/codex" 2>/dev/null || true

rm -rf "$HOME/arena"

sudo auditctl -D 2>/dev/null || true

echo "[ARENA] Cleanup complete. VM ready for destruction."
