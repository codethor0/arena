#!/bin/bash
set -euo pipefail

LOG_FILE="$HOME/arena/logs/install_$(date +%Y%m%d_%H%M%S).log"
mkdir -p "$(dirname "$LOG_FILE")"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "[ARENA] Starting agent installation..."

command -v curl >/dev/null 2>&1 || { echo "FAIL: curl not found"; exit 1; }
command -v npm >/dev/null 2>&1 || { echo "FAIL: npm not found"; exit 1; }
command -v python3 >/dev/null 2>&1 || { echo "FAIL: python3 not found"; exit 1; }

export NPM_CONFIG_PREFIX="$HOME/.npm-global"
export PATH="$HOME/.npm-global/bin:$HOME/.local/bin:$PATH"

echo "[ARENA] Installing Claude Code..."
if ! command -v claude &>/dev/null; then
    curl -fsSL https://claude.ai/install.sh | bash
    echo "PASS: Claude Code installed"
else
    echo "PASS: Claude Code already present"
fi

echo "[ARENA] Installing Codex CLI..."
if ! command -v codex &>/dev/null; then
    npm install -g @openai/codex
    echo "PASS: Codex CLI installed"
else
    echo "PASS: Codex CLI already present"
fi

export PATH="$HOME/.npm-global/bin:$HOME/.local/bin:$PATH"
claude --version || { echo "FAIL: Claude Code version check failed"; exit 1; }
codex --version || { echo "FAIL: Codex CLI version check failed"; exit 1; }

echo "[ARENA] All agents installed successfully."
