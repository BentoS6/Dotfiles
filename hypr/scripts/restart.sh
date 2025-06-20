#!/usr/bin/zsh

#script to kill and restart waybar
pkill waybar
waybar &
disown