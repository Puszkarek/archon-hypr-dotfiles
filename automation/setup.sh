#!/bin/bash

# Exit on any error
set -e

# Get the repo root (parent of automation/)
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "=== Copying config files ==="
cp -r "$REPO_ROOT"/.config/* ~/.config/

echo "=== Copying fonts ==="
sudo cp -r "$REPO_ROOT"/fonts/.fonts/* /usr/share/fonts/
mkdir -p ~/.config/fontconfig
cp -R "$REPO_ROOT"/fonts/fontconfig/* ~/.config/fontconfig/

echo "=== Copying icons ==="
sudo cp -r "$REPO_ROOT"/.icons/* /usr/share/icons/

echo "=== Copying SDDM theme ==="
sudo cp -r "$REPO_ROOT"/sddm/* /usr/share/sddm/themes/

echo "=== Configuring SDDM ==="
sudo mkdir -p /etc/sddm.conf.d
printf "[Theme]\nCurrent=nyxtralis\n" | sudo tee /etc/sddm.conf.d/nyxtralis.conf

echo "=== Copying zen-browser files ==="
ZEN_PROFILE=$(ls ~/.zen/ 2>/dev/null | grep -v -E '^(default|released|beta)$' | head -1)
if [ -n "$ZEN_PROFILE" ]; then
    cp -r "$REPO_ROOT"/zen-browser/* ~/.zen/"$ZEN_PROFILE"/chrome/
    echo "Copied to zen profile: $ZEN_PROFILE"
else
    echo "No zen-browser profile found, skipping"
fi

echo "=== Creating utility folders ==="
mkdir -p ~/grimoire/desires
mkdir -p ~/grimoire/pacts
mkdir -p ~/grimoire/coven
mkdir -p ~/grimoire/appendices
mkdir -p ~/grimoire/revelations
mkdir -p ~/incantations

echo "=== Enabling SDDM service ==="
sudo systemctl enable sddm

echo "=== Setup complete ==="
