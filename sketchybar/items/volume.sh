#!/bin/bash

sketchybar --add item volume right \
    --set volume script="$PLUGIN_DIR/volume.sh" \
    icon.drawing=off \
    background.color=$SURFACE0 \
    background.padding_left=0

sketchybar --add item volume_logo right \
    --set volume_logo icon=􀊩 \
    icon.color=$BASE \
    label.drawing=off \
    background.color=$MAUVE
