# Unraid Tools

A User Scripts plugin script that automatically downloads and installs useful command-line tools not shipped with Unraid by default. Tools are installed on array start and persist for the entire array session.

## 🎯 Purpose

Unraid 7.1.4+ ships with minimal command-line utilities. This script enhances your Unraid system by automatically installing modern developer and administration tools that disappear on reboot but are reinstalled fresh on each array start.

## 🛠️ Tools Included

| Tool | Purpose | Size |
|------|---------|------|
| **yq** | YAML/JSON processor | ~4MB |
| **ctop** | Container monitoring | ~8MB |
| **ripgrep** | Fast text search | ~6MB |
| **btop** | Modern system monitor | ~3MB |
| **lazydocker** | Docker TUI | ~12MB |
| **gping** | Graphical ping | ~4MB |

## 📋 Requirements

- **Unraid 7.1.4+** (may work on 6.x)
- **User Scripts plugin** installed
- **Internet connection** during array start
- **x86_64 architecture** (standard Unraid systems)

## 🚀 Installation

### Step 1: Install User Scripts Plugin
1. Go to **Apps** in Unraid WebGUI
2. Search for "User Scripts"
3. Install the **User Scripts** plugin by **Andrew Zawadzki**

### Step 2: Add the Installation Script
1. Go to **Settings** → **User Scripts**
2. Click **Add New Script**
3. Name it: `install-tools`
4. Set schedule to: **At Startup of Array**
5. Copy the contents of `install-tools.sh` into the script
6. Click **Save Changes**

### Step 3: Run or Wait
- **Manual**: Click **Run Script** to install immediately
- **Automatic**: Tools will install on next array start

## 💡 How It Works

```
Array Start → User Scripts → install-tools.sh → /usr/local/bin/ → Ready to Use
```

1. **Array starts** → User Scripts plugin executes
2. **Downloads** latest releases from GitHub
3. **Installs** to `/usr/local/bin/` (already in PATH)
4. **Tools available** for entire array session
5. **Reboot** → Process repeats with latest versions

## 🔧 Usage Examples

```bash
# YAML/JSON processing
yq eval '.services.web.image' docker-compose.yml

# Container monitoring  
ctop

# Fast text search
rg "TODO" /mnt/user/appdata/ --type md

# System monitoring
btop

# Docker management
lazydocker

# Network diagnostics
gping google.com
```

## 🏗️ Architecture

### Why Session-Persistent?
- **Always Latest**: Fresh download ensures current versions
- **No Maintenance**: No manual updates needed
- **Simple**: No complex persistence management
- **Minimal Overhead**: ~37MB total, downloaded once per array start

### File Locations
- **Installation Target**: `/usr/local/bin/` (session-persistent)
- **Download Cache**: `/tmp/` (auto-cleanup)
- **Script Location**: `/boot/config/plugins/user.scripts/`

## 🛡️ Unraid Compatibility

### ✅ Works With
- RAM disk architecture (tools installed fresh each boot)
- No package manager (direct binary downloads)
- Slackware base (static binaries used)
- Flash boot system (minimal flash writes)

### ⚠️ Limitations
- **Internet Required**: Must have connectivity during array start
- **x86_64 Only**: Won't work on ARM systems
- **Session Only**: Tools disappear on reboot (by design)

## 🔄 Adding New Tools

To add a new tool, follow this pattern in `install-tools.sh`:

```bash
# Download latest release
wget -q "$(curl -s https://api.github.com/repos/USER/REPO/releases/latest | grep browser_download_url | grep linux | grep x86_64 | cut -d '"' -f 4)" -O /tmp/tool

# Make executable and install
chmod +x /tmp/tool
mv /tmp/tool /usr/local/bin/toolname
```

## 🐛 Troubleshooting

### Tools Not Found After Installation
- Check if User Scripts plugin is installed
- Verify script is set to run "At Startup of Array"
- Check script execution logs in User Scripts interface

### Download Failures
- Ensure internet connectivity during array start
- Check GitHub API rate limits (rare)
- Verify tool repository URLs are still valid

### Permission Issues
- User Scripts runs as root, should have full permissions
- Verify `/usr/local/bin` is writable (standard Unraid)

## 📚 Technical Details

- **Base System**: Unraid 7.1.4 (Slackware-based)
- **Architecture**: x86_64 Linux
- **Download Method**: GitHub releases API + wget
- **Installation**: Direct binary placement
- **Persistence**: Session-only (reinstalled on array start)

## 🤝 Contributing

1. Fork the repository
2. Test new tools on actual Unraid system
3. Ensure tools are static binaries (no dependencies)
4. Update README with tool details
5. Submit pull request

## 📄 License

MIT License - Feel free to modify and distribute.

## ⚠️ Disclaimer

This script downloads and installs third-party binaries. While all included tools are from reputable sources, use at your own risk. Always review code before running on your system.