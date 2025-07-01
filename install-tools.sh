#!/bin/bash
#
# This script installs several useful command-line tools for Unraid.
# It's designed to be run from the User Scripts plugin.
#

echo "--- Installing custom command-line utilities ---"

# 1. yq (YAML Query)
echo "Installing yq..."
wget -q https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq
chmod +x /usr/local/bin/yq

# 2. ctop (Container Top)
echo "Installing ctop..."
wget -q https://github.com/bcicen/ctop/releases/latest/download/ctop-linux-amd64 -O /usr/local/bin/ctop
chmod +x /usr/local/bin/ctop

# 3. ripgrep (rg)
echo "Installing ripgrep (rg)..."
wget -q https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep-x86_64-unknown-linux-musl.tar.gz -O /tmp/ripgrep.tar.gz
tar -zxvf /tmp/ripgrep.tar.gz -C /tmp/
mv /tmp/ripgrep-*/rg /usr/local/bin/
rm -rf /tmp/ripgrep*

# 4. btop (Modern htop)
echo "Installing btop..."
wget -q https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz -O /tmp/btop.tbz
tar -xjf /tmp/btop.tbz -C /usr/local/
rm /tmp/btop.tbz

# 5. lazydocker (Docker TUI)
echo "Installing lazydocker..."
wget -q https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_Linux_x86_64.tar.gz -O /tmp/lazydocker.tar.gz
tar -zxvf /tmp/lazydocker.tar.gz -C /usr/local/bin lazydocker
rm /tmp/lazydocker.tar.gz

# 6. gping (Graphical Ping)
echo "Installing gping..."
wget -q https://github.com/orf/gping/releases/latest/download/gping-x86_64-unknown-linux-musl.tar.gz -O /tmp/gping.tar.gz
tar -zxvf /tmp/gping.tar.gz -C /tmp/
mv /tmp/gping /usr/local/bin/
rm /tmp/gping.tar.gz

echo "--- All tools installed successfully! ---"