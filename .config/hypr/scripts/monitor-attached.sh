#!/usr/bin/env bash

LAPTOP_DISPLAY="eDP-1"
USER="winter"
UUID="1000"

active_instance=""
for instance in /run/user/"$UUID"/hypr/*; do
  if [[ -d "$instance" ]]; then
    instance_name=$(basename "$instance")
    if sudo -u "$USER" HYPRLAND_INSTANCE_SIGNATURE="$instance_name" hyprctl activewindow &>/dev/null; then
      active_instance="$instance_name"
      break
    fi
  fi
done

if [[ -z "$active_instance" ]]; then
  echo "No active Hyprland instance found"
  exit 1
fi

export HYPRLAND_INSTANCE_SIGNATURE="$active_instance"

monitor_count=$(sudo -u "$USER" HYPRLAND_INSTANCE_SIGNATURE="$active_instance" hyprctl monitors -j | jq -r ".[].name" | grep -v "$LAPTOP_DISPLAY" | wc -l)

if [[ "$monitor_count" -gt 0 ]]; then
  sudo -u "$USER" HYPRLAND_INSTANCE_SIGNATURE="$active_instance" hyprctl keyword monitor "$LAPTOP_DISPLAY,disable"
  sudo -u "$USER" HYPRLAND_INSTANCE_SIGNATURE="$active_instance" hyprctl keyword env "GDK_SCALE,1.75"
else
  sudo -u "$USER" HYPRLAND_INSTANCE_SIGNATURE="$active_instance" hyprctl keyword monitor "$LAPTOP_DISPLAY,highres,auto,2.0"
  sudo -u "$USER" HYPRLAND_INSTANCE_SIGNATURE="$active_instance" hyprctl keyword env "GDK_SCALE,2"
fi
