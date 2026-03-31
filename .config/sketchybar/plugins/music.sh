#!/bin/bash

STATE=$(osascript -e 'tell application "Music" to if it is running then get player state')
if [ "$STATE" = "playing" ]; then
  TITLE=$(osascript -e 'tell application "Music" to if it is running and player state is playing then get name of current track')
  ARTIST=$(osascript -e 'tell application "Music" to if it is running and player state is playing then get artist of current track')
  sketchybar --set title label="$TITLE" drawing=on
  sketchybar --set artist label="$ARTIST" drawing=on
else
  sketchybar --set title drawing=off
  sketchybar --set artist drawing=off
fi
