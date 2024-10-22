#!/bin/bash

sketchybar --add item pressure right \
    --set pressure update_freq=60 \
    script="$PLUGIN_DIR/pressure.sh" \
    icon.drawing=off \
    background.color=$SURFACE0 \
    background.padding_left=0

sketchybar --add item pressure_logo right \
    --set pressure_logo icon=󰈸 icon.color=$BASE label.drawing=off \
    background.color=$RED
