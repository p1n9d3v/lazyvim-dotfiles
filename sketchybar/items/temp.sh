#!/bin/bash

sketchybar --add item temp right \
    --set temp update_freq=1 \
    script="$PLUGIN_DIR/temp.sh" \
    icon.drawing=off \
    background.color=$SURFACE0 \
    background.padding_left=0

sketchybar --add item temp_logo right \
    --set temp_logo icon= icon.color=$BASE label.drawing=off \
    background.color=$YELLOW
