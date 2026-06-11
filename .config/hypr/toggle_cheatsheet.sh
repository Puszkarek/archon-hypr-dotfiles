#!/bin/bash

# Check if vim_cheatsheet window exists
WINDOW_EXISTS=$(hyprctl clients -j | jq -r '.[] | select(.title == "vim_cheatsheet") | .address')

if [ -n "$WINDOW_EXISTS" ]; then
    # Window exists, close it
    hyprctl dispatch closewindow "address:$WINDOW_EXISTS"
else
    # Window doesn't exist, open it
    hyprctl dispatch exec "[float] kitty --title vim_cheatsheet --override initial_window_width=1600  sh -c 'glow -p ~/.config/hypr/vim_vscode_cheatsheet.md; read'"
fi
