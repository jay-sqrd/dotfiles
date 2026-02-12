#!/usr/bin/env bash
set -euo pipefail

WS="1:dev"

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

# Always go to the target workspace (creates it if missing)
swaymsg "workspace \"$WS\"" >/dev/null

# If reloading, kill existing dev windows so we don't duplicate
for a in devterm devranger devnvim; do
  swaymsg "[app_id=\"$a\"] kill" >/dev/null 2>&1 || true
done

# Left terminal
foot --app-id devterm &
wait_app devterm
swaymsg "[app_id=\"devterm\"] move to workspace \"$WS\"" >/dev/null
swaymsg '[app_id="devterm"] focus' >/dev/null
swaymsg 'splith' >/dev/null

# Right top: ranger
foot --app-id devranger -e ranger &
wait_app devranger
swaymsg "[app_id=\"devranger\"] move to workspace \"$WS\"" >/dev/null
swaymsg '[app_id="devranger"] focus' >/dev/null
swaymsg 'splitv' >/dev/null

# Right bottom: nvim
foot --app-id devnvim -e nvim &
wait_app devnvim
swaymsg "[app_id=\"devnvim\"] move to workspace \"$WS\"" >/dev/null

# Final focus to left
swaymsg '[app_id="devterm"] focus' >/dev/null
