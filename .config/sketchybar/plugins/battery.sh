#!/bin/bash

percent="$(pmset -g batt | grep -o '[0-9]\+%' | head -1)"

sketchybar --set "$NAME" \
    label="$percent"
