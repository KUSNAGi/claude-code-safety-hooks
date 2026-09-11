#!/usr/bin/env bash
set -e
echo "Installing Claude Code Safety Hooks..."
mkdir -p ~/.claude/hooks
cp hooks/pre-tool-use.py ~/.claude/hooks/pre-tool-use.py
chmod +x ~/.claude/hooks/pre-tool-use.py
echo "✓ Hooks installed into ~/.claude/hooks/pre-tool-use.py"
echo "To test: echo '{"tool_name": "bash", "command": "rm -rf /"}' | python3 ~/.claude/hooks/pre-tool-use.py"
