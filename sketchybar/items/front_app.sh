#!/bin/bash

front_app=(
    label.font="$FONT:Bold:16.0"
    icon.background.drawing=on
    display=active
    script="$PLUGIN_DIR/front_app.sh"
    click_script="open -a 'Mission Control'"
    label.color=$TEXT
    label.padding_left=10
)
sketchybar --add item front_app left \
    --set front_app "${front_app[@]}" \
    --subscribe front_app front_app_switched
