#!/bin/bash
#
# Declare variables
WallPath=~/.config/hypr/wallpapers/

cd $WallPath
WallPaper=1271789.png
# run pywal
wal -i $WallPaper >> /dev/null

# restart waybar with new colors 
killall waybar && waybar >> /dev/null & disown 

# repopulate and re-run Hyprpaper
sed -i '1 c \preload = '"$WallPaper"'' ~/.config/hypr/hyprpaper.conf
sed -i '2 c \wallpaper = eDP-1, '"$WallPaper"'' ~/.config/hypr/hyprpaper.conf
killall hyprpaper && hyprpaper >> /dev/null & disown
makoctl reload
