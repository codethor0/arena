#!/bin/bash
set -euo pipefail

echo "[ARENA] Setting up VM environment..."

sudo apt-get update -qq
sudo apt-get install -y -qq sysstat htop procps

mkdir -p "$HOME/arena/battleground"
mkdir -p "$HOME/arena/logs"
mkdir -p "$HOME/arena/results/battle_logs"

chmod 777 "$HOME/arena/battleground"

echo "[ARENA] VM setup complete."
