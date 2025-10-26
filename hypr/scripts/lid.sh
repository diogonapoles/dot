#!/usr/bin/env bash

LOG_FILE="/tmp/lid-switch.log"

echo "[$(date)] Lid script called with argument: $1" >>"$LOG_FILE"

if hyprctl monitors | grep -q "Monitor DP-[0-9]"; then
  if [[ "$1" == "close" ]]; then
    hyprctl keyword monitor "eDP-1,disable" >>"$LOG_FILE" 2>&1
  elif [[ "$1" == "open" ]]; then
    hyprctl keyword monitor "eDP-1,highres,3840x0,auto" >>"$LOG_FILE" 2>&1
  fi
else
  hyprlock
fi
