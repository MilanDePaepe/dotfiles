#!/bin/bash

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"

OMNICTL="/opt/homebrew/bin/omniwmctl"
EXEC_SCRIPT="$HOME/.config/sketchybar/plugins/omniwm_windows.sh"

while true; do
    "$OMNICTL" watch workspace-bar \
        --reconnect \
        --exec "$EXEC_SCRIPT"
    sleep 2
done
