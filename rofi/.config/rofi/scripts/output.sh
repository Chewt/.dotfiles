#!/bin/bash
# Custom script for rofi to select one of two monitor modes

if [[ -n "$@" ]] ; then
    /home/hayden/Scripts/change-monitor-profile.sh $@
    exit
fi

echo "top"
echo "both"
