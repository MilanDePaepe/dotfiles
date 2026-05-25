#!/bin/bash

sketchybar --add item title q \
  --set title \
  icon.font="sketchybar-app-font:Regular:16.0" \
  label.font="Hack Nerd Font Mono:Bold:14" \
  icon=":music:" \
  icon.padding_right=10 \
  background.drawing=on \
  background.color=$ITEM_BG_COLOR \
  background.height=28 \
  update_freq=1 \
  \
  label.max_chars=15 \
  label.scroll_duration=200 \
  drawing=off \
  scroll_texts=on \
  script="$PLUGIN_DIR/music.sh" \
  click_script="open -a Music" # label.color="$ACCENT_COLOR" \

sketchybar --add item artist e \
  --set artist \
  label.font="Hack Nerd Font Mono:Bold:14" \
  background.drawing=on \
  \
  background.color=$ITEM_BG_COLOR \
  background.height=28 \
  drawing=off \
  padding_left=0 \
  label.max_chars=30 \
  label.scroll_duration=50 \
  icon.drawing=off \
  scroll_texts=on \
  click_script="open -a Music" # label.color="$ACCENT_COLOR" \
