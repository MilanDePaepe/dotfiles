#!/bin/bash

sid="$1"

# Get apps in this workspace
apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

# Build icon strip
icon_strip=""
if [ -n "$apps" ]; then
  while read -r app; do
    icon_strip+=" $($PLUGIN_DIR/icon_map_fn.sh "$app")"
  done <<<"$apps"
fi

# Show or hide workspace depending on content
if [ -n "$icon_strip" ]; then
  sketchybar --set $NAME drawing=on label="$icon_strip"
else
  sketchybar --set $NAME drawing=off
fi

# Focus styling
# if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
#   sketchybar --set $NAME icon="$sid" label.color=0xffcba6f7 icon.color=0xffcba6f7
# else
#   sketchybar --set $NAME icon="$sid" label.color=0xffffffff icon.color=0xffffffff
# fi
if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME icon="$sid" icon.color=0xffcba6f7
else
  sketchybar --set $NAME icon="$sid" icon.color=0xffffffff
fi
