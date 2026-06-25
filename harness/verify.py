#!/usr/bin/env python3
import os
import subprocess
import datetime

home = "/home/arena"
results_dir = os.path.join(home, "arena", "results")
os.makedirs(results_dir, exist_ok=True)
ts = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
results_file = os.path.join(results_dir, "verification_" + ts + ".txt")

env = os.environ.copy()
env["PATH"] = "/home/arena/.npm-global/bin:/home/arena/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

lines = []
lines.append("ARENA VERIFICATION REPORT")
lines.append("Generated: " + datetime.datetime.now().isoformat())
lines.append("================================")
lines.append("")
lines.append("--- CLAUDE CODE STATUS ---")

claude_bin = subprocess.run(["bash", "-c", "command -v claude"], capture_output=True, text=True, env=env)
if claude_bin.returncode == 0:
    lines.append("CLAUDE BINARY: PRESENT at " + claude_bin.stdout.strip())
    version = subprocess.run(["claude", "--version"], capture_output=True, text=True, env=env)
    if version.returncode == 0:
        lines.append("CLAUDE VERSION: " + version.stdout.strip())
    else:
        lines.append("CLAUDE VERSION: UNAVAILABLE")
else:
    lines.append("CLAUDE BINARY: ABSENT")

if os.path.isdir(os.path.join(home, ".claude")):
    lines.append("CLAUDE CONFIG_DIR: PRESENT")
else:
    lines.append("CLAUDE CONFIG_DIR: ABSENT")

if os.path.isfile(os.path.join(home, ".claude.json")):
    lines.append("CLAUDE CONFIG_FILE: PRESENT")
else:
    lines.append("CLAUDE CONFIG_FILE: ABSENT")

claude_pids = subprocess.run(["pgrep", "-f", "claude"], capture_output=True, text=True, env=env)
if claude_pids.returncode == 0 and claude_pids.stdout.strip():
    lines.append("CLAUDE PROCESSES: RUNNING (PIDs: " + claude_pids.stdout.strip().replace("\n", " ") + ")")
else:
    lines.append("CLAUDE PROCESSES: NONE")

lines.append("")
lines.append("--- CODEX CLI STATUS ---")

codex_bin = subprocess.run(["bash", "-c", "command -v codex"], capture_output=True, text=True, env=env)
if codex_bin.returncode == 0:
    lines.append("CODEX BINARY: PRESENT at " + codex_bin.stdout.strip())
    version = subprocess.run(["codex", "--version"], capture_output=True, text=True, env=env)
    if version.returncode == 0:
        lines.append("CODEX VERSION: " + version.stdout.strip())
    else:
        lines.append("CODEX VERSION: UNAVAILABLE")
else:
    lines.append("CODEX BINARY: ABSENT")

if os.path.isdir(os.path.join(home, ".codex")):
    lines.append("CODEX CONFIG_DIR: PRESENT")
else:
    lines.append("CODEX CONFIG_DIR: ABSENT")

if os.path.isdir(os.path.join(home, ".config", "codex")):
    lines.append("CODEX CONFIG_DIR2: PRESENT")
else:
    lines.append("CODEX CONFIG_DIR2: ABSENT")

codex_pids = subprocess.run(["pgrep", "-f", "codex"], capture_output=True, text=True, env=env)
if codex_pids.returncode == 0 and codex_pids.stdout.strip():
    lines.append("CODEX PROCESSES: RUNNING (PIDs: " + codex_pids.stdout.strip().replace("\n", " ") + ")")
else:
    lines.append("CODEX PROCESSES: NONE")

lines.append("")
lines.append("================================")
lines.append("VERIFICATION COMPLETE")

content = "\n".join(lines) + "\n"
with open(results_file, "w") as f:
    f.write(content)
print(content, end="")
