#!/bin/sh

while [ true ]
do
  if [[ $(cat /sys/class/power_supply/BAT0/status) = 'Discharging' ]]; then
    if [[ $(cat /sys/class/power_supply/BAT0/capacity) -le $LOW_BAT ]]; then
      i3-nagbar -t warning -m 'Low battery'
    fi
  fi
  sleep 60
done
