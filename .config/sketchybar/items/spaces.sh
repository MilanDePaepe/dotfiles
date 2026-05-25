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

for sid in 1 2 3 4 5 6 7 8 9 10 A S D F G; do
  sketchybar --add item space.$sid left \
    \
    --subscribe space.$sid \
    aerospace_workspace_change \
    aerospace_focus_changed \
    aerospace_monitor_change \
    --set space.$sid \
    drawing=on \
    label.drawing=on \
    label.font="sketchybar-app-font:Regular:16.0" \
    background.drawing=on \
    background.color=0x00ffffff \
    icon="$sid" \
    icon.padding_left=4 \
    icon.padding_right=4 \
    label.padding_right=0 \
    label.padding_left=0 \
    label.y_offset=-1 \
    click_script="aerospace workspace $sid" \
    script="$PLUGIN_DIR/aerospace.sh $sid"
done

spaces=()
for sid in $(aerospace list-workspaces --all); do
  spaces+=(space.$sid)
done

sketchybar --add bracket spaces_bracket spacer_left_spaces "${spaces[@]}" \
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
