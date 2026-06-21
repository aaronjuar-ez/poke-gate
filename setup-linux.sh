#!/bin/bash
# Poke Gate - Linux Setup Script (Headless Daemon)
set -e

# Configuration
USER_HOME=$(eval echo ~$USER)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$USER_HOME/.config/poke-gate"
AGENT_DIR="$CONFIG_DIR/agents"
SERVICE_NAME="poke-gate"
SERVICE_FILE="/etc/systemd/system/$SERVICE_NAME.service"

echo "==> Setting up Poke Gate for Linux..."

# 1. Install dependencies
echo "==> Installing Node.js dependencies..."
npm install

# 2. Create config directories
echo "==> Creating config directories..."
mkdir -p "$AGENT_DIR"

# 3. Create systemd service
echo "==> Creating systemd service file..."
sudo tee "$SERVICE_FILE" > /dev/null <<EOF
[Unit]
Description=Poke Gate - MCP Tunnel for Poke AI
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$REPO_DIR
ExecStart=$(which node) bin/poke-gate.js --mode full
Restart=always
Environment=NODE_ENV=production
# Uncomment and set POKE_TOKEN to skip interactive login on headless servers
# Environment=POKE_TOKEN=your_token_here

[Install]
WantedBy=multi-user.target
EOF

# 4. Reload and start service
echo "==> Reloading systemd and starting service..."
sudo systemctl daemon-reload
sudo systemctl enable "$SERVICE_NAME"
sudo systemctl start "$SERVICE_NAME"

echo ""
echo "==> Setup complete!"
echo ""
echo "Check status:"
echo "  sudo systemctl status $SERVICE_NAME"
echo ""
echo "View logs:"
echo "  journalctl -u $SERVICE_NAME -f"
echo ""
echo "Note: If this is a headless server, you may need to set POKE_TOKEN"
echo "in $SERVICE_FILE or run 'node bin/poke-gate.js' once to authenticate via browser."
