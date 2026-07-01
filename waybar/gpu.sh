#!/usr/bin/env bash

output=$(nvidia-smi --query-gpu=temperature.gpu,utilization.gpu --format=csv,noheader,nounits 2>/dev/null)

temp=$(echo "$output" | cut -d',' -f1 | tr -d ' ')
util=$(echo "$output" | cut -d',' -f2 | tr -d ' ')

# Fallback
if [[ -z "$temp" ]]; then
    echo " N/A"
    exit 0
fi

# Icon logic (same idea as Waybar temperature icons)
if (( temp < 40 )); then
    icon=""
elif (( temp < 55 )); then
    icon=""
elif (( temp < 70 )); then
    icon=""
elif (( temp < 85 )); then
    icon=""
else
    icon=""
fi

# Icon logic (same idea as Waybar temperature icons)
if (( util < 25 )); then
    icon_util="󰡳"
elif (( util < 50 )); then
    icon_util="󰡵"
elif (( util < 75 )); then
    icon_util="󰊚"
elif (( util < 100 )); then
    icon_util="󰡴"
else
    icon_util="󰡴"
fi
echo " 󰢮 : ${icon_util} ${util}% ${icon} ${temp}°C " 

