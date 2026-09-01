# scripts/

Supporting scripts for the Codespaces DevBox demo. See the top-level
[README.md](../README.md) for how each script maps to a specific talking
point.

| Script | Trigger | Purpose |
|---|---|---|
| `postCreate.sh` | Run automatically once by Codespaces (`postCreateCommand` in `.devcontainer/devcontainer.json`) when a codespace is created | Installs the GitHub Copilot CLI and the Claude Code CLI, verifies core tool versions, and prints a summary of where each demo talking point lives. |
| `mock-server.js` | Run manually: `node scripts/mock-server.js &` | Minimal local HTTP server on port 4000 that stands in for a real internal API and a real AI Gateway, so the demo works without any external company infrastructure. |
| `internal-api-demo.sh` | Run manually after `mock-server.js` is running: `bash scripts/internal-api-demo.sh` | Sends a GET request to `$INTERNAL_API_URL` (defaults to the mock server) to demonstrate a codespace calling an internal API. In production this URL would instead point at a private endpoint reached via VPN or an SSH/port-forward tunnel. |
| `ai-gateway-demo.sh` | Run manually after `mock-server.js` is running: `bash scripts/ai-gateway-demo.sh` | Sends a POST request with a JSON prompt to `$AI_GATEWAY_URL` (defaults to the mock server) to demonstrate a codespace calling a company-internal AI gateway, over the same private-network path as any other internal API. |

## Typical demo flow

```bash
node scripts/mock-server.js &     # 1. start the stand-in backend
bash scripts/internal-api-demo.sh # 2. call the "internal API"
bash scripts/ai-gateway-demo.sh   # 3. call the "AI Gateway"
```

Each script is also individually documented with a header comment explaining
its usage, environment variables, and how it maps to a real production setup.
