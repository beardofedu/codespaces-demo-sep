# Codespaces DevBox Demo

This repo is a working demo environment configured to touch on specific
evaluation points raised about using **GitHub Codespaces as an
enterprise "DevBox" solution**.

## Talking points covered

| Topic | Where it's demonstrated |
|---|---|
| **Support for Claude Code** | `scripts/postCreate.sh` installs the Claude Code CLI on codespace creation, same as any other dev tool (no native GitHub integration required) |
| **Support for GitHub Copilot** | `.devcontainer/devcontainer.json` preinstalls the Copilot & Copilot Chat VS Code extensions; Copilot CLI is available via `gh extension` |
| **Access to internal APIs** | `scripts/internal-api-demo.sh` + `forwardPorts`/`remoteEnv` in devcontainer.json model calling a private/internal service. In production this maps to [connecting Codespaces to a private network](https://docs.github.com/en/enterprise-cloud@latest/codespaces/developing-in-a-codespace/connecting-to-a-private-network) via VPN or tunnel |
| **Access to the AI Gateway** | `scripts/ai-gateway-demo.sh` models a call to an internal AI gateway over the same private-network path as any internal API |
| **Access to GitHub Enterprise** (confirmed) | `.github/workflows/enterprise-policy-demo.yml` — org/enterprise policy & audit log context |
| **Support for different hardware profiles** (confirmed) | `hostRequirements` in `.devcontainer/devcontainer.json`; org admins can also [restrict available machine types](https://docs.github.com/en/enterprise-cloud@latest/codespaces/managing-codespaces-for-your-organization/restricting-access-to-machine-types) |

## Try it

1. Click **Code → Codespaces → Create codespace on main**.
2. Once it boots, run:
   ```bash
   node scripts/mock-server.js &
   bash scripts/internal-api-demo.sh
   bash scripts/ai-gateway-demo.sh
   ```
3. Open Copilot Chat in the editor, or run `gh copilot suggest "..."`.
4. Try installing/running `claude` (Claude Code) — it works like any CLI tool.

## Notes for the conversation

- Internal API / AI Gateway access in a real deployment depends on their
  network topology (VPN, private endpoints, or SSH tunneling into
  on-prem/VPC-only services) — worth a follow-up scoping call with their
  network/security team.
- Claude Code and other third-party agents are supported as regular
  installed CLI tools, not as a native GitHub integration the way Copilot is.
