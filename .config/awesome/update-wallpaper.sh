#!/bin/bash
WALLPAPER_DIR="$HOME/.wallpapers/backgrounds-2560x1416"
TODAY=$(date +%m-%d)
WALLPAPER_FILE="$WALLPAPER_DIR/bg2560x1416_$TODAY.png"

if [ -f "$WALLPAPER_FILE" ]; then
    echo "
    local gears = require('gears')
    for s in screen do
        gears.wallpaper.maximized('$WALLPAPER_FILE', s, false)
    end
    " | awesome-client
fi
