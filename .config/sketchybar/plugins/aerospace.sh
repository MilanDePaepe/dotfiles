#!/bin/bash

if echo "$EMPTY_WORKSPACES" | grep -q "$1"; then
    sketchybar --set space.$1 drawing=off
elif echo "$FOCUSED_WORKSPACE" | grep -q "$1"; then
    sketchybar --set space.$1 drawing=on
    sketchybar --set space.$1 background.drawing=on 
else
    sketchybar --set space.$1 drawing=on
    sketchybar --set space.$1 background.drawing=off
fi
