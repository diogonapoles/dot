#!/usr/bin/env bash

if ! hyprctl monitors | grep -q "Monitor DP-[0-9]"; then
  hyprlock
fi
