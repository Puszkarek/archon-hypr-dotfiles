#!/bin/bash

# Exit on any error
set -e

# Step 1: Setup yay (AUR helper)
echo "=== Setting up yay ==="
if ! command -v yay &> /dev/null; then
    # Install base-devel and git (required for building AUR packages)
    sudo pacman -S --needed base-devel git
    # Clone yay from AUR
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    # Build and install yay
    makepkg -si
    # Cleanup
    cd ~
    rm -rf /tmp/yay
else
    echo "yay already installed"
fi

# Step 2: Install all pacman dependencies
echo "=== Installing pacman dependencies ==="
sudo pacman -S --noconfirm \
    # Shell commands
    fish lsd unzip wl-clipboard cliphist grim slurp gpu-screen-recorder nodejs-lts-krypton \
    # Desktop apps & services
    alacritty rofi waybar dunst \
    # Terminal UIs
    ranger cava bluetui \
    # Fonts
    noto-fonts-cjk ttf-nerd-fonts-symbols \
    # Fun & display
    cowsay fortune-mod fastfetch

# Step 3: Install all yay (AUR) dependencies - Applications
echo "=== Installing yay dependencies ==="
yay -S --noconfirm \
    zen-browser-bin slack-desktop devin-desktop antigravity-ide tidal-hifi-bin xwayland-satellite wayfreeze-git

# Step 4: Install Oh-My-Fish (Fish shell framework)
echo "=== Installing Oh-My-Fish ==="
curl -L https://get.oh-my.fish | fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Step 5: Install Rust
echo "=== Installing Rust ==="
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.cargo/env

# Step 6: Install npm
echo "=== Installing npm ==="
sudo pacman -S --noconfirm npm

# Step 7: Install waybar-bard
echo "=== Installing waybar-bard ==="
mkdir -p ~/grimoire/desires
cd ~/grimoire/desires
if [ -d "bard" ]; then
    echo "bard directory already exists, pulling latest changes"
    cd bard
    git pull
else
    echo "cloning bard repository"
    git clone https://github.com/Puszkarek/bard.git
    cd bard
fi
sudo -E env "PATH=$PATH" make install
cd ~

echo "=== Installation complete ==="
