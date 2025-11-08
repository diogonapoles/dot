#!/usr/bin/env bash

if hyprctl monitors | grep -q "Monitor DP-[0-9]"; then
  if [[ "$1" == "close" ]]; then
    hyprctl keyword monitor "eDP-1,disable"
  elif [[ "$1" == "open" ]]; then
    hyprctl keyword monitor "eDP-1,highres,3840x0,auto"
  fi
else
  hyprctl keyword monitor "eDP-1,highres,3840x0,auto"
  hyprlock
fi
