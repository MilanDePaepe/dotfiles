#!/bin/bash

sketchybar --add item front_app left \
  --set front_app icon.drawing=on \
  icon.font="sketchybar-app-font:Regular:16.0" \
  label.font="Hack Nerd Font Mono:Bold:14" \
  \
  script="$PLUGIN_DIR/front_app.sh" \
  background.drawing=on \
  background.color=$ITEM_BG_COLOR \
  background.height=28 \
  icon.drawing=off \
  label.max_chars=15 \
  label.padding_left=10 \
  label.padding_right=10 \
  scroll_texts=on \
  label.scroll_duration=200 \
  --subscribe front_app front_app_switched # label.color="$ACCENT_COLOR" \
