#!/usr/bin/env node
//
// mock-server.js
// ==============
// Minimal HTTP server so the demo talking points have something to hit
// locally inside the codespace, standing in for real internal API / AI
// gateway endpoints during a live demo (no external network access needed).
//
// Usage:
//   node scripts/mock-server.js            # foreground, listens on :4000
//   node scripts/mock-server.js &          # background, so you can also run
//                                           #   internal-api-demo.sh / ai-gateway-demo.sh
//   PORT=5000 node scripts/mock-server.js  # override the port
//
// Endpoints:
//   GET  /internal-api  -> { source: "internal-api", status: "ok", data: ... }
//   POST /ai-gateway     -> { source: "ai-gateway", status: "ok", response: ... }
//   *    (anything else) -> generic "mock server" status response
//
// The port this listens on (default 4000) is auto-forwarded by
// .devcontainer/devcontainer.json's `forwardPorts`/`portsAttributes`, which
// is what lets a real internal API or AI Gateway be reached the same way
// once this mock is swapped for a real endpoint over a private network.
const http = require("http");

const server = http.createServer((req, res) => {
  res.setHeader("Content-Type", "application/json");
  if (req.url.startsWith("/internal-api")) {
    res.end(JSON.stringify({ source: "internal-api", status: "ok", data: "mock internal API response" }));
  } else if (req.url.startsWith("/ai-gateway")) {
    res.end(JSON.stringify({ source: "ai-gateway", status: "ok", response: "mock AI gateway completion" }));
  } else {
    res.end(JSON.stringify({ status: "ok", message: "codespaces-demo-sep mock server" }));
  }
});

const PORT = process.env.PORT || 4000;
server.listen(PORT, () => console.log(`Mock server listening on :${PORT}`));
