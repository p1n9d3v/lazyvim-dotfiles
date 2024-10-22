#!/bin/bash

sketchybar --add event aerospace_workspace_change

for m in $(aerospace list-monitors | awk '{print $1}'); do
    for i in $(aerospace list-workspaces --monitor $m); do
        sid=$i
        space=(
            space="$sid"
            icon="$sid"
            icon.highlight_color=$RED
            icon.padding_left=10
            icon.padding_right=10
            display=$m
            padding_left=2
            padding_right=2
            label.padding_right=20
            label.color=$TEXT
            label.highlight_color=$RED
            label.font="sketchybar-app-font:Regular:16.0"
            label.y_offset=-1
            background.color=$BACKGROUND
            background.border_color=$ROSEWATER
            background.border_width=2
            script="$PLUGIN_DIR/space.sh"
            background.corner_radius=10
        )

        sketchybar --add space space.$sid left \
            --set space.$sid "${space[@]}" \
            --subscribe space.$sid mouse.clicked

        apps=$(aerospace list-windows --workspace $sid | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

        icon_strip=" "
        if [ "${apps}" != "" ]; then
            while read -r app; do
                icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
            done <<<"${apps}"
        else
            icon_strip=" —"
        fi

        sketchybar --set space.$sid label="$icon_strip"
    done

    for i in $(aerospace list-workspaces --monitor $m --empty); do
        sketchybar --set space.$i display=0
    done

done

space_creator=(
    icon="󰬫"
    icon.font="$FONT:Bold:24.0"
    padding_left=10
    padding_right=8
    label.drawing=off
    display=active
    script="$PLUGIN_DIR/space_windows.sh"
    icon.color=$TEXT
)

sketchybar --add item space_creator left \
    --set space_creator "${space_creator[@]}" \
    --subscribe space_creator aerospace_workspace_change
