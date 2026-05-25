#!/bin/bash

export WHITE=0xffffffff
export ITEM_BG_COLOR=0x4a181a22

COLOR_THEME_FILE="$CONFIG_DIR/.color_theme"

case "$1" in
teal | gray | grey | purple | red | blue | green | orange | yellow)
  COLOR_THEME="$1"
  echo "$COLOR_THEME" >"$COLOR_THEME_FILE"
  ;;
*)
  if [ -f "$COLOR_THEME_FILE" ]; then
    COLOR_THEME=$(<"$COLOR_THEME_FILE")
  else
    COLOR_THEME=green
  fi
  ;;
esac

case "$COLOR_THEME" in
teal) ACCENT_COLOR=0xff2cf9ed ;;
gray | grey) ACCENT_COLOR=0xffffffff ;;
purple) ACCENT_COLOR=0xffcba6f7 ;;
red) ACCENT_COLOR=0xffb81c3f ;;
blue) ACCENT_COLOR=0xff60a5fa ;;
green) ACCENT_COLOR=0xff1dfca1 ;;
orange) ACCENT_COLOR=0xffff7b00 ;;
yellow) ACCENT_COLOR=0xfff7fc17 ;;
*) ACCENT_COLOR=0xff4ade80 ;;
esac
export ACCENT_COLOR
