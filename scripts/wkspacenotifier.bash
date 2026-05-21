#!/bin/bash
#read current workspace name, add +1
CURRENT_WORKSPACE=$(($(xprop -root -notype _NET_CURRENT_DESKTOP|sed 's/_NET_CURRENT_DESKTOP = //g')+1))
while true
do
	#check every second
	sleep 1
	NEW_WORKSPACE=$(($(xprop -root -notype _NET_CURRENT_DESKTOP|sed 's/_NET_CURRENT_DESKTOP = //g')+1))
	#if there is a change, save the current value and notify the number 
	if [ $CURRENT_WORKSPACE -ne $NEW_WORKSPACE ]; then
		CURRENT_WORKSPACE=$NEW_WORKSPACE
		notify-send -t 2000 $CURRENT_WORKSPACE
	fi
done
