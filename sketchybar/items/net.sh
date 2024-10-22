#!/bin/bash

sketchybar --add item net right \
    --set net script="$PLUGIN_DIR/net.sh" \
    icon.drawing=off \
    background.color=$SURFACE0 \
    background.padding_left=0

sketchybar --add item net_logo right \
    --set net_logo icon= \
    icon.color=$BASE \
    label.drawing=off \
    background.color=$SAPPHIRE
