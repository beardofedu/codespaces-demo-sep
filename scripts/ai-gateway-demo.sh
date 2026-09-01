#!/usr/bin/env bash
#
# ai-gateway-demo.sh
# ===================
# Demonstrates reaching an "AI Gateway" from inside a codespace.
#
# Usage:
#   node scripts/mock-server.js &     # start the local stand-in server first
#   bash scripts/ai-gateway-demo.sh
#
# Env vars:
#   AI_GATEWAY_URL   URL to call (default: http://localhost:4000/ai-gateway,
#                    served by scripts/mock-server.js)
#
# What it does:
#   Sends a single POST request with a JSON prompt body to $AI_GATEWAY_URL
#   and prints the response. As with internal-api-demo.sh, the "gateway" is
#   the local mock-server.js so this is runnable with no external services.
#
# How this maps to production:
#   This models a company-internal AI gateway (proxying/metering calls to
#   LLM providers) that a codespace's code or agents can call over the same
#   private network path as any other internal API - distinct from GitHub
#   Copilot itself, which is not routed through a customer-hosted AI gateway.
set -euo pipefail

AI_GATEWAY_URL="${AI_GATEWAY_URL:-http://localhost:4000/ai-gateway}"

echo "Calling AI Gateway at: $AI_GATEWAY_URL"
curl -s -X POST "$AI_GATEWAY_URL" \
  -H "Content-Type: application/json" \
  -d '{"prompt": "hello from a codespace"}' \
  || echo "(no local server running - start scripts/mock-server.js to try this live)"
