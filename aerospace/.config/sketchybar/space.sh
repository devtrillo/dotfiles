#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

sketchybar --add event aerospace_workspace_change

RED=0xffed8796
for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item "space.$sid" left \
    --subscribe "space.$sid" aerospace_workspace_change \
    --set "space.$sid" \
    icon="$sid" \
    icon.padding_left=5 \
    icon.padding_right=5 \
    label.padding_right=33 \
    icon.highlight_color=$RED \
    background.color=0x44ffffff \
    background.corner_radius=5 \
    background.height=30 \
    background.drawing=off \
    label.font="sketchybar-app-font:Regular:16.0" \
    label.background.height=30 \
    label.background.drawing=on \
    label.background.color=0xff494d64 \
    label.background.corner_radius=9 \
    label.drawing=off \
    click_script="aerospace workspace $sid" \
    script="$CONFIG_DIR/plugins/aerospacer.sh $sid"
done