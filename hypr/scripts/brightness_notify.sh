#!/bin/zsh

# Adjust brightness
brightnessctl set "$1"

# Get current brightness percentage
BRIGHTNESS=$(brightnessctl g)
MAX_BRIGHTNESS=$(brightnessctl m)
PERCENT=$((BRIGHTNESS * 100 / MAX_BRIGHTNESS))

# Send Dunst notification with a progress bar
dunstify -r 9999 -t 1000 "Brightness: ${PERCENT}%" -h int:value:"${PERCENT}"