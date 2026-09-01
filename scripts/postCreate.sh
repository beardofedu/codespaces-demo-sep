#!/usr/bin/env bash
# Runs once when the codespace is created.
# Demonstrates: (1) installing a third-party AI CLI agent (Claude Code) the
# same way any dev tool is installed, and (2) confirming GitHub Copilot CLI
# availability inside the container.
set -euo pipefail

echo "==> Installing GitHub Copilot CLI"
npm install -g @githubnext/github-copilot-cli >/dev/null 2>&1 || \
  echo "    (skipped - install via 'gh extension install github/gh-copilot' or npm as needed)"

echo "==> Installing Claude Code CLI (demo: third-party agent support)"
npm install -g @anthropic-ai/claude-code >/dev/null 2>&1 || \
  echo "    (skipped - requires network access to npm registry; install manually if blocked)"

echo "==> Verifying tool versions"
node --version
python3 --version
gh --version | head -n1

echo "==> Codespace ready. See README.md for talking points on:"
echo "    - GitHub Copilot support"
echo "    - Claude Code support"
echo "    - Internal API access (see scripts/internal-api-demo.sh)"
echo "    - AI Gateway access (see scripts/ai-gateway-demo.sh)"
echo "    - GitHub Enterprise (org policy, confirmed)"
echo "    - Hardware profiles (see .devcontainer/devcontainer.json hostRequirements)"
