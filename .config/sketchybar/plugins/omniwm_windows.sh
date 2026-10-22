#!/bin/bash

set -u

SB="/opt/homebrew/bin/sketchybar"
JQ="/usr/bin/jq"
OMNICTL="/opt/homebrew/bin/omniwmctl"

input="$(cat)"

kind="$(printf '%s' "$input" | "$JQ" -r '.result.kind // empty')"

[[ "$kind" != "workspace-bar" ]] && exit 0

# Build list of available omni monitor IDs
available_omni="$(
  printf '%s' "$input" |
  "$JQ" -r '.result.payload.monitors[].id' | tr '\n' ' '
)"

for display in 1 2; do
  # Try to get the preferred omni monitor based on original dual mapping
  preferred="display:$((3 - display))"
  if echo "$available_omni" | grep -q "$preferred"; then
    omni_monitor="$preferred"
  else
    # Fallback to first available
    omni_monitor="$(printf '%s' "$input" | "$JQ" -r '.result.payload.monitors[0].id // empty')"
  fi

  # ─────────────────────────────────────────
  # Focused workspace for this monitor
  # ─────────────────────────────────────────

  focused_workspace="$(
    printf '%s' "$input" |
    "$JQ" -r \
      --arg monitor "$omni_monitor" '
      .result.payload.monitors[]
      | select(.id == $monitor)
      | .workspaces[]
      | select(.isFocused == true)
      | .rawName
    ' |
    head -1
  )"

  # No workspace data for this monitor.
  if [[ -z "$focused_workspace" ]]; then

    for workspace in 1 2 3 4 5; do
      "$SB" --set \
        "display${display}.workspace.${workspace}" \
        drawing=off
    done

    "$SB" --set \
      "display${display}.workspace_separator" \
      drawing=off

    for i in {1..10}; do
      "$SB" --set \
        "display${display}.window.${i}" \
        drawing=off
    done

    continue
  fi

  # ─────────────────────────────────────────
  # Workspaces
  # ─────────────────────────────────────────

  for workspace in 1 2 3 4 5; do

    exists="$(
      printf '%s' "$input" |
      "$JQ" -r \
        --arg monitor "$omni_monitor" \
        --arg workspace "$workspace" '
        [
          .result.payload.monitors[]
          | select(.id == $monitor)
          | .workspaces[]
          | select(.rawName == $workspace)
        ] | length
      '
    )"

    item="display${display}.workspace.${workspace}"

    if [[ "$exists" == "0" ]]; then
      "$SB" --set "$item" drawing=off
      continue
    fi

    if [[ "$workspace" == "$focused_workspace" ]]; then
      "$SB" --set "$item" \
        drawing=on \
        label.color=0xffd6deeb \
        background.drawing=on \
        background.color=0xff334656
    else
      "$SB" --set "$item" \
        drawing=on \
        label.color=0xff7f8c98 \
        background.drawing=off
    fi

  done

  "$SB" --set "display${display}.workspace_separator" drawing=on

  # ─────────────────────────────────────────
  # Windows
  # ─────────────────────────────────────────

  app_count="$(
    printf '%s' "$input" |
    "$JQ" -r \
      --arg monitor "$omni_monitor" \
      --arg workspace "$focused_workspace" '
      .result.payload.monitors[]
      | select(.id == $monitor)
      | .workspaces[]
      | select(.rawName == $workspace)
      | .windows | length
    '
  )"

  [[ "$app_count" == "null" ]] && app_count=0

  for i in {1..10}; do
    item="display${display}.window.${i}"
    if (( i > app_count )); then
      "$SB" --set "$item" drawing=off
      continue
    fi

    app="$(
      printf '%s' "$input" |
      "$JQ" -r \
        --arg monitor "$omni_monitor" \
        --arg workspace "$focused_workspace" \
        --argjson i "$i" '
        .result.payload.monitors[]
        | select(.id == $monitor)
        | .workspaces[]
        | select(.rawName == $workspace)
        | .windows[$i - 1].appName
        '
    )"

    focused="$(
      printf '%s' "$input" |
      "$JQ" -r \
        --arg monitor "$omni_monitor" \
        --arg workspace "$focused_workspace" \
        --argjson i "$i" '
        .result.payload.monitors[]
        | select(.id == $monitor)
        | .workspaces[]
        | select(.rawName == $workspace)
        | .windows[$i - 1].isFocused
        '
    )"

    window_id="$(
      printf '%s' "$input" |
      "$JQ" -r \
        --arg monitor "$omni_monitor" \
        --arg workspace "$focused_workspace" \
        --argjson i "$i" '
        .result.payload.monitors[]
        | select(.id == $monitor)
        | .workspaces[]
        | select(.rawName == $workspace)
        | .windows[$i - 1].id
        '
    )"

    [[ -z "$app" || "$app" == "null" ]] && continue

    if [[ "$focused" == "true" ]]; then
      color="0xffd6deeb"
      background="0xff334656"
    else
      color="0xff7f8c98"
      background="0x00000000"
    fi

    "$SB" --set "$item" \
      drawing=on \
      label="$app" \
      label.color="$color" \
      background.drawing=on \
      background.color="$background" \
      background.corner_radius=8 \
      background.height=26 \
      click_script="$OMNICTL window focus '$window_id'"

  done

done

"$SB" --update
