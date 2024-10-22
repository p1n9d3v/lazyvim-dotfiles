#!/bin/bash

sketchybar --add item date right \
    --set date update_freq=1000 \
    icon.drawing=off \
    script="$PLUGIN_DIR/date.sh" \
    background.color=$SURFACE0 \
    background.padding_left=0

sketchybar --add item clock_logo right --set clock_logo icon= \
    icon.color=$BASE label.drawing=off \
    background.color=$LAVENDER
