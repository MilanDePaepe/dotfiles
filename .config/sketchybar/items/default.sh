#!/bin/bash

##### Changing Defaults #####
# We now change some default values, which are applied to all further items.
# For a full list of all available item properties see:
# https://felixkratz.github.io/SketchyBar/config/items

default=(
  padding_left=5
  padding_right=5
  icon.font="Hack Nerd Font Mono:Bold:17.0"
  label.font="JetBrains Mono Nerd Font:Bold:14.0"
  icon.color=$ACCENT_COLOR
  label.color=$WHITE
  background.drawing=off
  background.color=$ITEM_BG_COLOR
  background.border_color=0x2ab0b8cc
  background.border_width=1
  background.height=24
  background.corner_radius=9
  icon.padding_left=8
  icon.padding_right=8
  label.padding_left=8
  label.padding_right=8
)
sketchybar --default "${default[@]}"
