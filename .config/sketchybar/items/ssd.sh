#!/bin/bash

# SSD_usage
sketchybar --add item ssd_usage right \
  --set ssd_usage \
  script="$PLUGIN_DIR/ssd_usage.sh" \
  update_freq=60 \
  icon="" \
  icon.padding_right=4 \
  background.color=$ITEM_BG_COLOR \
  background.drawing=on \
  background.height=28 \
  icon.font="Hack Nerd Font Mono:Bold:20.0"
