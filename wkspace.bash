#!/bin/bash
CURRENT_WORKSPACE=$(($(xprop -root -notype _NET_CURRENT_DESKTOP|sed 's/_NET_CURRENT_DESKTOP = //g')+1))
while true
do
	sleep 1
	NEW_WORKSPACE=$(($(xprop -root -notype _NET_CURRENT_DESKTOP|sed 's/_NET_CURRENT_DESKTOP = //g')+1))
	if [ $CURRENT_WORKSPACE -ne $NEW_WORKSPACE ]; then
		CURRENT_WORKSPACE=$NEW_WORKSPACE
		notify-send -t 2000 $CURRENT_WORKSPACE
	fi
done
