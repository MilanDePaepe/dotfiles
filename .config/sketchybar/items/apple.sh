#!/bin/bash

sketchybar --add item apple left \
  --set apple \
  icon="" \
  icon.font="Hack Nerd Font Mono:Bold:25.0" \
  background.drawing=off \
  background.height=28 \
  icon.padding_right=-10

sketchybar --add item spacer_left left \
  --set spacer_left \
  width=8 \
  background.drawing=off \
  label.drawing=off \
  icon.drawing=off

sketchybar --add bracket left_bracket apple \
  --set left_bracket \
  background.color=$ITEM_BG_COLOR \
  background.drawing=on \
  background.height=28
