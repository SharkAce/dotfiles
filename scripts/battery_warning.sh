#!/bin/sh
closed=0
while [ true ]
do
  if [[ $(cat /sys/class/power_supply/BAT0/capacity) -ge $LOW_BAT ]]; then
    closed=0
  fi
  if [[ $(cat /sys/class/power_supply/BAT0/status) = 'Discharging' ]]; then
    if [[ $(cat /sys/class/power_supply/BAT0/capacity) -le $LOW_BAT && $closed = 0 ]]; then
      i3-nagbar -t warning -m 'Low battery'
      closed=1
    fi
  fi
  sleep 60
done
