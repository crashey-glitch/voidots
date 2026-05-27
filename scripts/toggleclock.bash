#!/bin/bash
#use with: source ./path/toggleclock.bash

ON=$(pgrep peaclock)

if [ "$ON" = '' ];then
    xfce4-terminal --hide-borders --hide-scrollbar --geometry=34x17 -x peaclock
    export TOUCH=0
else
    pkill peaclock
    export TOUCH=1
fi