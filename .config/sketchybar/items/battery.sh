#!/bin/bash

# Battery
sketchybar --add item battery right \
  --set battery \
  script="$PLUGIN_DIR/battery.sh" \
  icon.padding_right=4 \
  background.color=$ITEM_BG_COLOR \
  background.drawing=on \
  background.height=28 \
  update_freq=60
