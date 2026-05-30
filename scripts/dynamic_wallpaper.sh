#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/dotfiles/wallpapers"
SWAP_INTERVAL=600 # 600 seconds = 10 minutes

# Give Hyprland a second to fully boot
sleep 1

OLD_PID=""

while true; do
    # Grab a random image from the folder
    RANDOM_BG=$(find "$WALLPAPER_DIR" -type f \( -name '*.jpg' -o -name '*.png' \) | shuf -n 1)

    # If it found a wallpaper, launch a new swaybg instance in the background
    if [ -n "$RANDOM_BG" ]; then
        swaybg -i "$RANDOM_BG" -m fill &
        NEW_PID=$!

        # Wait 1 second to let the new wallpaper fully load/draw on top
        sleep 1

        # Smoothly kill the previous wallpaper process so it doesn't leak memory memory/flash black
        if [ -n "$OLD_PID" ]; then
            kill $OLD_PID 2>/dev/null
        fi
        
        OLD_PID=$NEW_PID
    fi

    # Wait for the interval before swapping again
    sleep $SWAP_INTERVAL
done
