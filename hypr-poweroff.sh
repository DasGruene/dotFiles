#!/usr/bin/env bash

CHOICE=$(printf "No\nYes" | rofi -dmenu -p "Power Off System?"  -theme ~/.config/rofi/exit_prompt.rasi -filter "") 

if [[ "$CHOICE" == "Yes" ]]; then
    systemctl poweroff
fi

