#!/usr/bin/env bash

LOG_FILE="/tmp/lid-switch.log"

echo "[$(date)] Lid script called with argument: $1" >> "$LOG_FILE"

if hyprctl monitors | grep -q "Monitor DP-[0-9]"; then
  echo "[$(date)] External monitor detected" >> "$LOG_FILE"
  if [[ "$1" == "close" ]]; then
    echo "[$(date)] Disabling eDP-1" >> "$LOG_FILE"
    hyprctl keyword monitor "eDP-1,disable" >> "$LOG_FILE" 2>&1
  elif [[ "$1" == "open" ]]; then
    echo "[$(date)] Enabling eDP-1" >> "$LOG_FILE"
    hyprctl keyword monitor "eDP-1,highres,3840x0,auto" >> "$LOG_FILE" 2>&1
  fi
else
  echo "[$(date)] No external monitor detected" >> "$LOG_FILE"
fi
