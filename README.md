<p align="center">
  <img src="assets/logo.png" width="128" height="128" alt="Poke Gate icon">
</p>

<h1 align="center">Poke Gate</h1>

<p align="center">
  Let your <a href="https://poke.com">Poke</a> AI assistant access your machine.<br>
  <sub>A community project — not affiliated with Poke or The Interaction Company.</sub>
</p>

<p align="center">
  <a href="https://github.com/f/poke-gate/releases/latest"><img src="https://img.shields.io/github/v/release/v/release/f/poke-gate?style=flat-square" alt="Latest Release"></a>
  <a href="https://www.npmjs.com/package/poke-gate"><img src="https://img.shields.io/npm/v/poke-gate?style=flat-square" alt="npm"></a>
  <a href="https://github.com/f/poke-gate/blob/main/LICENSE"><img src="https://img.shields.io/github/license/f/poke-gate?style=flat-square" alt="License"></a>
  <img src="https://img.shields.io/badge/platform-macOS%20%7C%20Linux-blue?style=flat-square" alt="Platform">
</p>

---

Run Poke Gate on your Mac or Linux server, then message Poke from iMessage, Telegram, or SMS to run commands, read files, take screenshots, and more — all on your machine.

## Install

### Linux (Headless Daemon)
To install as a background service on Linux:
```bash
git clone https://github.com/aaronjuar-ez/poke-gate.git
cd poke-gate
chmod +x setup-linux.sh
./setup-linux.sh
```

**Check Status & Logs:**
```bash
sudo systemctl status poke-gate
journalctl -u poke-gate -f
```

### macOS
**Homebrew** (recommended)
```bash
brew install f/tap/poke-gate
```

**Install via npx**
If you have Node.js installed, you can download and install the macOS app with a single command:
```bash
npx poke-gate download-macos
```

**CLI only** (no macOS app needed)
```bash
npx poke-gate
```

## Setup
1. Open Poke Gate (or start the daemon)
2. Sign in with Poke OAuth when prompted — a browser window opens automatically.
3. For headless Linux servers, set your `POKE_TOKEN` in the environment to skip the browser login.

## Tools
| Tool | What it does |
|------|-------------|
| `run_command` | Execute any shell command (ls, git, brew, python, curl…) |
| `read_file` | Read a text file |
| `read_image` | Read an image file and return it as base64 |
| `write_file` | Write content to a file |
| `list_directory` | List files and directories |
| `system_info` | OS, hostname, architecture, uptime, memory |
| `take_screenshot` | Capture the screen (requires Screen Recording permission) |

## Access modes
| Mode | Description |
|------|-------------|
| **Full** (default) | All tools available with no approval required. |
| **Limited** | Read-only tools plus a curated set of safe commands. |
| **Sandbox** | Restricted writes to `~/Downloads` and `/tmp` via macOS `sandbox-exec`. |

## License
MIT
