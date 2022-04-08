#!/bin/bash
ID=$(xdpyinfo | grep focus | cut -f4 -d " ")
PID=$(($(xprop -id $ID | grep -m 1 PID | cut -d " " -f 3) + 2))
if [ -e "/proc/$PID/cwd" ]
then
    # urxvt -cd $(readlink /proc/$PID/cwd) &
    alacritty --working-directory $(readlink /proc/$PID/cwd) &
else
    # urxvt
    alacritty
fi
