#!/bin/bash
#
# Declare variables
WalPath=~/.config/hypr/wallpapers/

# lauch Rofi dmenu
cd $WalPath
WALLPAPER=$(ls *{jpg,png} | rofi -dmenu -p "Select a Wallpaper")
if [[ -z $WALLPAPER ]] # validate that wallpaper was selected
then
	exit
fi
# save wallaper
sed -i '1 c \'"$WALLPAPER"'' ~/.config/hypr/scripts/current_wallpaper
# run pywal
wal -i $WALLPAPER >> /dev/null

# restart waybar with new colors 
killall waybar && waybar >> /dev/null & disown 

# repopulate and re-run Hyprpaper
sed -i '1 c \preload = '"$WALLPAPER"'' ~/.config/hypr/hyprpaper.conf
sed -i '2 c \wallpaper = eDP-1, '"$WALLPAPER"'' ~/.config/hypr/hyprpaper.conf
killall hyprpaper && hyprpaper >> /dev/null & disown
makoctl reload
