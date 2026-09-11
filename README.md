# 🛡️ Claude Code Safety Hooks & Conventional Changelog Suite

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Python 3.10+](https://img.shields.io/badge/python-3.10+-blue.svg)](https://www.python.org/downloads/)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-purple.svg)](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code)
[![Gumroad Free / PWYW](https://img.shields.io/badge/Gumroad-Free%20%2F%20%240%2B-brightgreen.svg)](https://nr1130.gumroad.com/l/claude-code-master-pack-732)

Autonomous AI coding agents (like Claude Code) execute bash commands directly in your local terminal. Without safeguards, a prompt injection or model hallucination can accidentally wipe code, execute unbounded database queries, or delete your file system.

This repository provides **drop-in pre-tool-use hooks** that inspect commands before execution and abort any destructive patterns with exit code `2`.

---

## ⚡ What It Intercepts

| Category | Blocked Command Patterns | Exit Code | Action |
|---|---|---|---|
| **Filesystem Wipe** | `rm -rf /`, `rm -rf ~`, `rm -rf .`, `rmdir /s /q` | `2` | Intercepted & Logged |
| **Database Destruction** | `DROP TABLE`, `DROP DATABASE`, `TRUNCATE`, unbounded `DELETE` | `2` | Intercepted & Logged |
| **Git Disasters** | `git push --force`, `git push -f`, `git reset --hard` | `2` | Intercepted & Logged |
| **Disk/Hardware** | `dd if=`, `mkfs`, `format C:`, `chmod -R 777 /` | `2` | Intercepted & Logged |
| **System Shutdown** | `shutdown`, `reboot`, `init 0` | `2` | Intercepted & Logged |

All blocked attempts are written to `~/.claude/hooks/blocked_commands.log` with timestamps.

---

## 🚀 Quickstart (30 Seconds)

### Linux / macOS
```bash
git clone https://github.com/KUSNAGi/claude-code-safety-hooks.git
cd claude-code-safety-hooks
chmod +x install.sh
./install.sh
```

### Windows
```cmd
git clone https://github.com/KUSNAGi/claude-code-safety-hooks.git
cd claude-code-safety-hooks\hooks
run_hook.bat
```

---

## 📦 Enterprise Supercharge Pack

Need enterprise features, pre-configured security rules, and automated PR review skills?

👉 **[Download the Full Claude Code Supercharge Pack on Gumroad ($0+ Pay-What-You-Want)](https://nr1130.gumroad.com/l/claude-code-master-pack-732)**

Includes:
1. **Pre-Tool-Use Hooks Suite** (Python + Bash + Windows batch launchers).
2. **Conventional Commit Changelog Generator** (`generate-changelog.py`).
3. **Automated Pull Request Reviewer & Security Auditing Skills**.
4. **Instant 1-Click Setup Scripts**.

---

## 📄 License
MIT License. Free for personal and commercial use.
