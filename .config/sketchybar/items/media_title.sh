#!/bin/bash

sketchybar --add item media_title q \
           --set media_title label.color=$ACCENT_COLOR \
                       label.max_chars=40 \
                       icon.padding_left=0 \
                       scroll_texts=on \
                       icon=􀑪             \
                       icon.color=$ACCENT_COLOR   \
                       background.drawing=off \
                       script="$PLUGIN_DIR/media_title.sh" \
           --subscribe media_title media_change
