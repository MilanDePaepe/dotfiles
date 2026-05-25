#!/bin/bash

for mid in $(aerospace list-monitors | cut -c1); do
  for sid in $(aerospace list-workspaces --monitor $mid); do
    sketchybar --set space.$sid drawing=on
  done
done
