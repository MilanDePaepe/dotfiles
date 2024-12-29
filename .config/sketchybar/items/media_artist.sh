#!/bin/bash


sketchybar --add item media_artist e \
           --set media_artist label.color=$ACCENT_COLOR \
                       label.max_chars=20 \
                       label.font="JetBrainsMono Nerd Font Mono:Italic:14.0" \
                       icon.padding_left=0 \
                       scroll_texts=on \
                       icon=              \
                       icon.color=$ACCENT_COLOR   \
                       background.drawing=off \
                       script="$PLUGIN_DIR/media_artist.sh" \
           --subscribe media_artist media_change
