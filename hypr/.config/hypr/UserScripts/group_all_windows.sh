#!/usr/bin/env bash
# Requires hyprctl + jq

# 1. Collect all windows
ws=$(hyprctl activeworkspace -j | jq '.id')
wins=($(hyprctl clients -j |
        jq -r --arg ws "$ws" '.[]
            | select(.workspace.id == ($ws|tonumber))
            | .address'))

# nothing to do
[ ${#wins[@]} -le 1 ] && exit 0

root="${wins[0]}"

# 2. Focus each in order to linearize tiling layout
for w in "${wins[@]}"; do
    hyprctl dispatch focuswindow address:$w
    sleep 0.05
done

# 3. Create group on root
hyprctl dispatch focuswindow address:$root
hyprctl dispatch togglegroup
sleep 0.1

# 4. Group all others one by one
for ((i=1;i<${#wins[@]};i++)); do
    w="${wins[$i]}"
    hyprctl dispatch focuswindow address:$w
    sleep 0.05
    hyprctl dispatch moveintogroup l
    sleep 0.05
done

# restore focus
hyprctl dispatch focuswindow address:$root

