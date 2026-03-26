#!/usr/bin/env bash

set -euo pipefail

max_label_length=30
separator=" - "

set_item_style() {
  local item="$1"
  local is_focused="$2"

  if [ "$is_focused" = "yes" ]; then
    sketchybar --set "$item" \
      background.color=0xffffffff \
      label.color=0xff000000
  else
    sketchybar --set "$item" \
      background.color=0x44ffffff \
      label.color=0xffffffff
  fi
}

truncate_text() {
  local text="$1"
  local limit="$2"

  if [ "${#text}" -le "$limit" ]; then
    printf '%s' "$text"
  elif [ "$limit" -le 1 ]; then
    printf '%s' "${text:0:$limit}"
  else
    printf '%s' "${text:0:$((limit - 1))}…"
  fi
}

build_label() {
  local app="$1"
  local title="$2"
  local duplicate_count="$3"
  local app_part subtitle remaining

  if [ "$duplicate_count" -le 1 ] || [ -z "$title" ]; then
    truncate_text "$app" "$max_label_length"
    return
  fi

  app_part="$(truncate_text "$app" "$max_label_length")"
  remaining=$((max_label_length - ${#app_part} - ${#separator}))

  if [ "$remaining" -le 0 ]; then
    truncate_text "$app" "$max_label_length"
    return
  fi

  subtitle="$(truncate_text "$title" "$remaining")"
  printf '%s%s%s' "$app_part" "$separator" "$subtitle"
}

focused_wid="$(
  aerospace list-windows --focused --format '%{window-id}' 2>/dev/null || true
)"

if [ "${SENDER:-}" = "aerospace_update" ]; then
  while IFS= read -r item; do
    [ -n "$item" ] || continue
    wid="${item#app.}"
    if [ "$wid" = "$focused_wid" ]; then
      set_item_style "$item" yes
    else
      set_item_style "$item" no
    fi
  done < <(
    sketchybar --query bar |
      jq -r '.items[]' |
      grep '^app\.'
  )
  exit 0
fi

sketchybar --set chevron drawing=off

# Remove previously generated workspace app items.
while IFS= read -r item; do
  [ -n "$item" ] || continue
  sketchybar --remove "$item"
done < <(
  sketchybar --query bar |
    jq -r '.items[]' |
    grep '^app\.'
)

previous_item="chevron"
has_apps=no
while IFS='|' read -r duplicate_count wid app title; do
  [ -n "$wid" ] || continue

  label="$(build_label "$app" "$title" "$duplicate_count")"
  has_apps=yes

  sketchybar --add item "app.$wid" left \
    --set "app.$wid" \
      icon.drawing=off \
      label="$label" \
      label.max_chars="$max_label_length" \
      scroll_texts=on \
      background.color=0x44ffffff \
      background.corner_radius=5 \
      background.height=20 \
      click_script="aerospace focus --window-id $wid" \
    --move "app.$wid" after "$previous_item"

  if [ "$wid" = "$focused_wid" ]; then
    set_item_style "app.$wid" yes
  fi

  previous_item="app.$wid"
done < <(
  aerospace list-windows --workspace focused \
    --format '%{window-id}|%{app-name}|%{window-title}' |
    awk -F'|' '
      { lines[NR] = $0; counts[$2]++ }
      END {
        for (i = 1; i <= NR; i++) {
          split(lines[i], parts, "|")
          print counts[parts[2]] "|" lines[i]
        }
      }
    '
)

if [ "$has_apps" = "yes" ]; then
  sketchybar --set chevron drawing=on
fi
