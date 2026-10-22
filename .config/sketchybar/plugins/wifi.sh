#!/bin/bash

NAME="${NAME:-wifi}"

DEVICE="en0"

# Check whether Wi-Fi has an IP address.
IP=$(ipconfig getifaddr "$DEVICE" 2>/dev/null)

if [[ -n "$IP" ]]; then
    sketchybar --set "$NAME" \
        drawing=on \
        label.drawing=on \
        label="Wi-Fi" \
        label.color=0xffd6deeb
else
    sketchybar --set "$NAME" \
        drawing=on \
        label.drawing=on \
        label="Offline" \
        label.color=0xfff07178
fi
