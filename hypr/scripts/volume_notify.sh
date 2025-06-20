#!/bin/bash

# script to show notifications while increasing and decreasing volume through fn keys
if [ "$1" == "toggle" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle  # Toggle mute
else
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$1"  # Adjust volume
fi

# Get current volume and mute status
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo "true" || echo "false")

if [ "$MUTED" == "true" ]; then
    ICON="audio-volume-muted"
    dunstify -r 9998 -t 1000 "Volume Muted" -i "$ICON"
else
    ICON="audio-volume-high"
    dunstify -r 9998 -t 1000 "Volume: ${VOLUME}%" -h int:value:"${VOLUME}" -i "$ICON"
fi
