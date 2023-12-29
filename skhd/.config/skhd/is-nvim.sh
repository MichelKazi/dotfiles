#!/bin/bash

# Add your terminal emulator to this list if it isn't listed
declare -a terminals=("Terminal" "Kitty" "iTerm2")
# Get the name of the currently focused application
focused_app=$(yabai -m query --windows --window | jq -r '.app')

# Check if the focused application is your terminal
if [[ " ${terminals[@]} " =~ " ${focused_app} "]] then
    # Get the title of the currently focused window
    window_title=$(yabai -m query --windows --window | jq -r '.title')

    # Heuristic check: If the window title contains 'nvim' - assume nvim/vim is running
    if [[ "$window_title" == *"- NVIM"* ]]; then
        echo "true"
    else
        echo "false"
    fi
else
    echo "false"
fi
