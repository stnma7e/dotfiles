#!/usr/bin/env bash

sid="$1"

focused="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"
all_workspaces="$(aerospace list-workspaces --all)"

exists=false
while IFS= read -r ws; do
  if [ "$ws" = "$sid" ]; then
    exists=true
    break
  fi
done <<< "$all_workspaces"

if [ "$exists" != true ]; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

if [ "$sid" = "$focused" ]; then
  sketchybar --set "$NAME" drawing=on background.drawing=on
else
  sketchybar --set "$NAME" drawing=on background.drawing=off
fi

