#!/usr/bin/env bash
# Demonstrates reaching an "AI Gateway" from inside a codespace.
#
# This models a company-internal AI gateway (proxying/metering calls to
# LLM providers) that a codespace's code or agents can call over the
# private network, distinct from GitHub Copilot itself (which is not
# routed through a customer AI gateway).
set -euo pipefail

AI_GATEWAY_URL="${AI_GATEWAY_URL:-http://localhost:4000/ai-gateway}"

echo "Calling AI Gateway at: $AI_GATEWAY_URL"
curl -s -X POST "$AI_GATEWAY_URL" \
  -H "Content-Type: application/json" \
  -d '{"prompt": "hello from a codespace"}' \
  || echo "(no local server running - start scripts/mock-server.js to try this live)"
