#!/usr/bin/env bash
set -euo pipefail

WS="2:sys"

wait_app() {
  local app="$1"
  for _ in $(seq 1 200); do
    if swaymsg -t get_tree | jq -e --arg a "$app" '..|objects|select(.app_id?==$a)' >/dev/null; then
      return 0
    fi
    sleep 0.05
  done
  echo "Timed out waiting for app_id=$app" >&2
  return 2
}

# Go to sys workspace
swaymsg "workspace \"$WS\"" >/dev/null

# Kill existing sys monitor window so reload doesn't duplicate
swaymsg '[app_id="sysmon"] kill' >/dev/null 2>&1 || true

# Launch btop in foot
foot --app-id sysmon -e btop &
wait_app sysmon

# Make absolutely sure it ends up on the sys workspace (handles races)
swaymsg "[app_id=\"sysmon\"] move to workspace \"$WS\"" >/dev/null

# Return to dev
swaymsg 'workspace "1:dev"' >/dev/null

