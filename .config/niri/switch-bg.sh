#!/bin/bash
# Switch background script
# Usage: switch-bg.sh <number>

BG_DIR="$HOME/.config/niri/backgrounds"
BG_NUM="${1:-1}"

# Kill existing swaybg instance
pkill swaybg

# Start new swaybg with selected background
swaybg -i "$BG_DIR/${BG_NUM}.svg" &
