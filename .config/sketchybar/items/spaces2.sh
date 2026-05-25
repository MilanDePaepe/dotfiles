#!/bin/bash

sketchybar --add event aerospace_workspace_change
sketchybar --add event aerospace_monitor_change
sketchybar --add event aerospace_focus_changed

sketchybar --add item spacer_left_spaces left \
  --set spacer_left_spaces \
  width=5 \
  background.drawing=off \
  label.drawing=off \
  icon.drawing=off

sketchybar --add item space.main left \
  --subscribe space.main \
  aerospace_workspace_change \
  aerospace_focus_changed \
  aerospace_monitor_change \
  --set space.main \
  drawing=on \
  label.drawing=on \
  icon.drawing=on \
  label.font="sketchybar-app-font:Regular:16.0" \
  background.drawing=on \
  background.color=0x00ffffff \
  background.border_width=0 \
  icon.padding_left=4 \
  icon.padding_right=8 \
  label.padding_right=5 \
  label.padding_left=0 \
  label.y_offset=-1 \
  script="$PLUGIN_DIR/aerospace2.sh"

sketchybar --add item space.separator left \
  --set space.separator \
  drawing=on \
  background.drawing=off \
  label.drawing=on \
  icon.drawing=off \
  label.padding_right=12 \
  label.padding_left=0 \
  label.color=$WHITE \
  label="│"

sketchybar --add item space.second left \
  --set space.second \
  drawing=on \
  label.drawing=on \
  icon.drawing=on \
  label.font="sketchybar-app-font:Regular:16.0" \
  background.drawing=on \
  background.color=0x00ffffff \
  background.border_width=0 \
  icon.padding_left=0 \
  icon.padding_right=4 \
  label.padding_right=10 \
  label.padding_left=5 \
  label.y_offset=-1

sketchybar --add bracket spaces_bracket spacer_left_spaces space.main space.separator space.second \
  --set spaces_bracket \
  background.color=$ITEM_BG_COLOR \
  background.drawing=on \
  background.height=28

sketchybar --add item icon_refresher left \
  --set icon_refresher \
  icon.drawing=off \
  label.drawing=off \
  background.drawing=off \
  width=2 \
  script="$PLUGIN_DIR/icon_refresh.sh" \
  --subscribe icon_refresher aerospace_focus_changed aerospace_workspace_change
