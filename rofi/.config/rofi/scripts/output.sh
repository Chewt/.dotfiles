#!/bin/bash
# Custom script for rofi to select one of two monitor modes


if [ x"$@" = x"top" ]
then
    /home/hayden/Scripts/top-mode.sh
    exit
fi

if [ x"$@" = x"both" ]
then
    /home/hayden/Scripts/home-mode.sh
    exit
fi

echo "top"
echo "both"
