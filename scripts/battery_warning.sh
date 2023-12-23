#!/bin/bash
LOW_BAT=15
message="Low Battery!"
color="#CC0000"
notif="$message\n\n$color"
if cat ~/.notification | grep -q "$message"; then
	exit
fi

if [[ $(cat /sys/class/power_supply/BAT0/status) = 'Discharging' ]]; then
	if [[ $(cat /sys/class/power_supply/BAT0/capacity) -le $LOW_BAT ]]; then
		echo -e "Low Battery!\n\n#CC0000" >> ~/.notification
	fi 
fi
