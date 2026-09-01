#!/usr/bin/env bash
# Demonstrates reaching an "internal API" from inside a codespace.
#
# In a real ConocoPhillips deployment this would instead be a private
# endpoint reachable via:
#   - a VPN / private network connection into the codespace, or
#   - an SSH/port-forward tunnel to an on-prem or VPC-only service.
# See: https://docs.github.com/en/enterprise-cloud@latest/codespaces/developing-in-a-codespace/connecting-to-a-private-network
set -euo pipefail

INTERNAL_API_URL="${INTERNAL_API_URL:-http://localhost:4000/internal-api}"

echo "Calling internal API at: $INTERNAL_API_URL"
curl -s "$INTERNAL_API_URL" || echo "(no local server running - start scripts/mock-server.js to try this live)"
