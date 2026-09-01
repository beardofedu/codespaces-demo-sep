#!/usr/bin/env node
// Minimal mock server so the demo talking points have something to hit
// locally inside the codespace (stands in for real internal API / AI
// gateway endpoints during the demo).
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
