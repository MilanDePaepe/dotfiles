#!/bin/bash

# Calendar
sketchybar --add item date right \
  --set date \
  update_freq=3600 \
  script="$PLUGIN_DIR/date.sh" \
  icon.drawing=off \
  label.font="JetBrains Mono:Regular:9" \
  label.padding_left=6 \
  width=0 \
  label.align=center \
  background.drawing=off \
  y_offset=6

sketchybar --add item time right \
  --set time \
  update_freq=30 \
  script="$PLUGIN_DIR/time.sh" \
  icon.drawing=off \
  label.font="JetBrains Mono:Bold:13" \
  label.padding_left=6 \
  width=0 \
  label.align=center \
  background.drawing=off \
  y_offset=-4

#Bracket for calendar, time
sketchybar --add bracket right_side date time \
  --set right_side background.color=$ITEM_BG_COLOR \
  background.drawing=on \
  background.height=28

# Spacer
sketchybar --add item spacer_right right \
  --set spacer_right \
  width=85 \
  background.drawing=off \
  label.drawing=off \
  icon.drawing=off
