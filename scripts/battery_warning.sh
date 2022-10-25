#!/bin/sh
closed=0
while [ true ]
do
  bat_pct=$(cat /sys/class/power_supply/BAT0/capacity)
  bat_sta=$(cat /sys/class/power_supply/BAT0/status)

  if [[ $bat_pct -ge $LOW_BAT ]]; then
    closed=0
  fi
  if [[ $bat_sta = 'Discharging' ]]; then
    if [[ $bat_pct -le $LOW_BAT && $closed = 0 ]]; then
      notify-send -i ~/icons/lowbat.png low\ battery -t 10000
      closed=1
    fi
  fi
  sleep 60
done
