#!/bin/bash
#
# Declare variables
WallPath=~/.config/hypr/wallpapers/

cd $WallPath
WallPaper=$(cat ~/.config/hypr/scripts/current_wallpaper)
# run pywal
wal -i $WallPaper >> /dev/null

# restart waybar with new colors 
killall waybar && waybar >> /dev/null & disown 

# repopulate and re-run Hyprpaper
sed -i '1 c \preload = '"$WallPath"''"$WallPaper"'' ~/.config/hypr/hyprpaper.conf
sed -i '2 c \wallpaper = eDP-1, '"$WallPath"''"$WallPaper"'' ~/.config/hypr/hyprpaper.conf
hyprpaper >> /dev/null & disown
makoctl reload
