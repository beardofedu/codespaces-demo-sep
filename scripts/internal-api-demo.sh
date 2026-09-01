#!/usr/bin/env bash
#
# internal-api-demo.sh
# ====================
# Demonstrates reaching an "internal API" from inside a codespace.
#
# Usage:
#   node scripts/mock-server.js &     # start the local stand-in server first
#   bash scripts/internal-api-demo.sh
#
# Env vars:
#   INTERNAL_API_URL   URL to call (default: http://localhost:4000/internal-api,
#                      served by scripts/mock-server.js)
#
# What it does:
#   Sends a single GET request to $INTERNAL_API_URL and prints the response.
#   In this demo the "internal API" is the local mock-server.js so the talking
#   point is runnable without any real company infrastructure.
#
# How this maps to production:
#   In a real enterprise deployment the URL above would instead be a private
#   endpoint reachable via:
#   - a VPN / private network connection into the codespace, or
#   - an SSH/port-forward tunnel to an on-prem or VPC-only service.
# See: https://docs.github.com/en/enterprise-cloud@latest/codespaces/developing-in-a-codespace/connecting-to-a-private-network
set -euo pipefail

INTERNAL_API_URL="${INTERNAL_API_URL:-http://localhost:4000/internal-api}"

echo "Calling internal API at: $INTERNAL_API_URL"
curl -s "$INTERNAL_API_URL" || echo "(no local server running - start scripts/mock-server.js to try this live)"
