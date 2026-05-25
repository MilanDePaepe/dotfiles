#!/bin/bash

# cpu_usage
sketchybar --add item cpu_usage right \
  --set cpu_usage \
  script="$PLUGIN_DIR/cpu_usage.sh" \
  update_freq=10 \
  icon.padding_right=4 \
  icon="" \
  background.color=$ITEM_BG_COLOR \
  background.drawing=on \
  background.height=28 \
  icon.font="Hack Nerd Font Mono:Bold:20.0"
