#!/usr/bin/env python3
import os
import psutil
import json
import time
import signal
import sys
from datetime import datetime

LOG_FILE = f"/home/{os.environ['USER']}/arena/logs/monitor_{datetime.now().strftime('%Y%m%d_%H%M%S')}.jsonl"
AGENT_NAMES = ["claude", "codex", "node"]

running = True

def signal_handler(sig, frame):
    global running
    running = False

signal.signal(signal.SIGINT, signal_handler)

def get_agent_processes():
    agents = []
    for proc in psutil.process_iter(['pid', 'name', 'cpu_percent', 'memory_info', 'cmdline']):
        try:
            cmdline = " ".join(proc.info['cmdline'] or [])
            if any(name in proc.info['name'].lower() or name in cmdline.lower() for name in AGENT_NAMES):
                proc_info = {
                    "timestamp": datetime.now().isoformat(),
                    "pid": proc.info['pid'],
                    "name": proc.info['name'],
                    "cpu_percent": proc.info['cpu_percent'],
                    "memory_rss": proc.info['memory_info'].rss if proc.info['memory_info'] else 0,
                    "cmdline": cmdline,
                    "open_files": [f.path for f in proc.open_files()] if hasattr(proc, 'open_files') else [],
                    "connections": [{"laddr": str(c.laddr), "raddr": str(c.raddr) if c.raddr else None, "status": c.status} for c in proc.connections()] if hasattr(proc, 'connections') else []
                }
                agents.append(proc_info)
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            continue
    return agents

def main():
    os.makedirs(os.path.dirname(LOG_FILE), exist_ok=True)
    with open(LOG_FILE, 'a') as f:
        while running:
            agents = get_agent_processes()
            for agent in agents:
                f.write(json.dumps(agent) + "\n")
            f.flush()
            time.sleep(1)
    print(f"Monitor stopped. Log: {LOG_FILE}")

if __name__ == "__main__":
    main()
