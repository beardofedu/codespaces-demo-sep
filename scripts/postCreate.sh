#!/usr/bin/env bash
#
# postCreate.sh
# =============
# Codespaces lifecycle hook, invoked automatically once via the
# `postCreateCommand` entry in .devcontainer/devcontainer.json, right after
# the container is built and before the user gets an editor session.
#
# What it does:
#   1. Installs the GitHub Copilot CLI (npm package), demonstrating native
#      Copilot support inside the container.
#   2. Installs the Claude Code CLI (npm package), demonstrating that
#      third-party AI CLI agents install and run like any other dev tool -
#      no special GitHub integration required.
#   3. Prints installed tool versions (Node, Python, gh) as a smoke test
#      that the base image + features came up correctly.
#   4. Prints a summary pointing to where each demo talking point lives.
#
# Not invoked manually in normal use - run it directly only if you want to
# re-run the install steps after editing them (e.g. `bash scripts/postCreate.sh`).
# Requires network access to the npm registry; failures are non-fatal and
# just print a fallback instruction instead of aborting the codespace build.
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
