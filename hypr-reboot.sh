#!/usr/bin/env bash

CHOICE=$(printf "No\nYes" | rofi -dmenu -p "Reboot Hyprland?"  -theme ~/.config/rofi/exit_prompt.rasi -filter "") 

if [[ "$CHOICE" == "Yes" ]]; then
  reboot
fi

