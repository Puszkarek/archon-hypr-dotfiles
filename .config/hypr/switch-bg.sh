#!/bin/bash

# Switch background script (hyprpaper)
# Usage: switch-bg.sh <number>

BG_DIR="$HOME/.config/hypr/backgrounds"
BG_NUM="${1:-1}"
BG_FILE="$BG_DIR/${BG_NUM}.png"

hyprctl hyprpaper preload "$BG_FILE"
hyprctl hyprpaper wallpaper ",$BG_FILE"

# Unload all other wallpapers
for f in "$BG_DIR"/*.png; do
    [ "$f" = "$BG_FILE" ] && continue
    hyprctl hyprpaper unload "$f" 2>/dev/null
done
