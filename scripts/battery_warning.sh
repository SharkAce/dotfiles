#!/bin/sh

while [ true ]
do
  if [[ $(cat /sys/class/power_supply/BAT0/capacity) -le $LOW_BAT ]]; then
    i3-nagbar -t warning -m 'Low battery'
  fi
  sleep 60
done
