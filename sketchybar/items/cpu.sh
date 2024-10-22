#!/bin/bash

sketchybar --add item cpu right \
    --set cpu update_freq=2 \
    icon.drawing=off \
    script="$PLUGIN_DIR/cpu.sh" \
    background.color=$SURFACE0 \
    background.padding_left=0

sketchybar --add item cpu_logo right --set cpu_logo icon= \
    icon.color=$BASE label.drawing=off \
    background.color=$TEAL
