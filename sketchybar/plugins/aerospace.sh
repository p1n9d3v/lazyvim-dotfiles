##!/bin/bash
#
## make sure it's executable with:
## chmod +x ~/.config/sketchybar/plugins/aerospace.sh
#
#if [ -z "$AEROSPACE_FOCUSED_WORKSPACE" ]; then
#    AEROSPACE_FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
#fi
#
#FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE
#if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#    sketchybar --set $NAME background.drawing=on
#else
#    sketchybar --set $NAME background.drawing=off
#fi

#!/bin/bash

echo \$FOCUSED_WORKSPACE: $FOCUSED_WORKSPACE, \$NAME: $NAME \$1: $1 >>~/.aerospace

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on
else
    sketchybar --set $NAME background.drawing=off
fi
