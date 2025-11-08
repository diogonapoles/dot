#!/usr/bin/env bash

if hyprctl monitors | grep -q "Monitor DP-[0-9]"; then
  if [[ "$1" == "close" ]]; then
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "desc:LG Electronics LG ULTRAFINE 210MATWMYU41,3840x2160@60.00,auto,1.666667"
  elif [[ "$1" == "open" ]]; then
    hyprctl keyword monitor "eDP-1,2880x1920@120.00,160x352,2.00"
    hyprctl keyword monitor "desc:LG Electronics LG ULTRAFINE 210MATWMYU41,3840x2160@60.00,1600x0,1.666667"
  fi
else
  hyprlock

  if ! hyprctl monitors | grep -q "Monitor eDP-1"; then
    hyprctl keyword monitor "eDP-1,2880x1920@120.00,auto,2.00"
  fi
fi
