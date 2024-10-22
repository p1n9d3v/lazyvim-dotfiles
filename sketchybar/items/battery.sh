#!/bin/bash

sketchybar --add item battery right \
    --set battery update_freq=3 \
    icon.drawing=off \
    script="$PLUGIN_DIR/power.sh" \
    background.color=$SURFACE0 \
    background.padding_left=0

sketchybar --add item power_logo right \
    --set power_logo icon= \
    icon.color=$BASE \
    label.drawing=off \
    background.color=$GREEN
