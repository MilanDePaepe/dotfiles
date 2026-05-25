#!/bin/bash
source "$CONFIG_DIR/colors.sh"

# Get apps in this workspace
# apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
#
# # Build icon strip
# icon_strip=""
# if [ -n "$apps" ]; then
#   while read -r app; do
#     icon_strip+=" $($PLUGIN_DIR/icon_map_fn.sh "$app")"
#   done <<<"$apps"
# fi

FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"
sid=$(aerospace list-workspaces --monitor 1 --visible)

apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
# Build icon strip
icon_strip=""
if [ -n "$apps" ]; then
  while read -r app; do
    icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
  done <<<"$apps"
fi
if [ "$sid" = "$FOCUSED" ]; then
  sketchybar --set space.main icon="$sid" icon.color=$ACCENT_COLOR label="$icon_strip" label.color=$ACCENT_COLOR
else
  sketchybar --set space.main icon="$sid" icon.color=0xffffffff label="$icon_strip" label.color=0xffffffff
fi

if [ $(aerospace list-monitors | wc -l | tr -d ' ') = "2" ]; then
  sketchybar --set space.separator drawing=on
  sid=$(aerospace list-workspaces --monitor 2 --visible)
  apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
  # Build icon strip
  icon_strip=""
  if [ -n "$apps" ]; then
    while read -r app; do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<<"$apps"
  fi
  if [ "$sid" = "$FOCUSED" ]; then
    sketchybar --set space.second icon="$sid" icon.color=$ACCENT_COLOR label="$icon_strip" label.color=$ACCENT_COLOR drawing=on
  else
    sketchybar --set space.second icon="$sid" icon.color=0xffffffff label="$icon_strip" label.color=0xffffffff drawing=on
  fi
else
  sketchybar --set space.separator drawing=off
  sketchybar --set space.second drawing=off
fi
