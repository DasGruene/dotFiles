#!/usr/bin/env bash

CHOICE=$(printf "No\nYes" | rofi -dmenu -p "Exit Hyprland?"  -theme ~/.config/rofi/exit_prompt.rasi -filter "") 

if [[ "$CHOICE" == "Yes" ]]; then
    hyprctl dispatch exit
fi

