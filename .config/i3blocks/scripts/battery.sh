#!/bin/bash

status=$(cat /sys/class/power_supply/BAT0/status)
capacity=$(cat /sys/class/power_supply/BAT0/capacity)

if [ $capacity -gt 80 ]; then
	icon=
elif [ $capacity -ge 60 ]; then
	icon=
elif [ $capacity -ge 40 ]; then
	icon=
elif [ $capacity -ge 20 ]; then
	icon=
else
	icon=
	sec_icon=' '
fi

if [ $status = "Charging" ]; then
	sec_icon=' '
fi

echo "$sec_icon$icon $capacity%"
