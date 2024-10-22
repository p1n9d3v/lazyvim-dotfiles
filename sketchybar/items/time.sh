#!/bin/bash

sketchybar --add item time right \
    --set time update_freq=1 \
    icon.drawing=off \
    script="$PLUGIN_DIR/time.sh" \
    background.color=$SURFACE0 \
    background.padding_left=0

sketchybar --add item time_logo right --set time_logo icon= \
    label.drawing=off \
    icon.color=$BASE \
    label.drawing=off \
    background.color=$PINK
