#!/bin/sh

battery_path="/sys/class/power_supply"

statusBat0=$(cat $battery_path/BAT0/status)
capacityBat0=$(cat $battery_path/BAT0/capacity)

if [[ -d "$battery_path/BAT1" ]]; then
	statusBat1=$(cat $battery_path/BAT1/status)
	capacityBat1=$(cat $battery_path/BAT1/capacity)
fi

declare -A battery_icons
battery_icons=(
	[Discharging,100]="󰁹"
	[Discharging,80]="󰁹"
	[Discharging,60]="󰂀"
	[Discharging,40]="󰁾"
	[Discharging,20]="󰁽"
	[Discharging,0]="󱃍"
	[Not charging,100]="󰁹"
	[Not charging,80]="󰁹"
	[Not charging,60]="󰂀"
	[Not charging,40]="󰁾"
	[Not charging,20]="󰁽"
	[Not charging,0]="󱃍"
	[Charging,100]="󰂃"
	[Charging,80]="󰁹"
	[Charging,60]="󰂉"
	[Charging,40]="󰢝"
	[Charging,20]="󰂇"
	[Charging,0]="󰢟"
	[Unknown,100]="?"
	[Unknown,80]="?"
	[Unknown,60]="?"
	[Unknown,40]="?"
	[Unknown,20]="?"
	[Unknown,0]="?"
	[Full,100]="󰁹"
)

function printBattery {
	local status=$1
	local capacity=$2
	local icon=''
	local level=''

	for ((i = 100; i >= 0; i -=20)); do
		if (( capacity >= i )); then
			level=$i
			break
		fi
	done

	icon=${battery_icons[$status,$level]}
	echo -n "$icon $capacity%"
}

if [[ -d "$battery_path/BAT1" ]]; then
	echo -n " "
	printBattery "$statusBat0" "$capacityBat0"
	echo -n "  "
	printBattery "$statusBat1" "$capacityBat1"
	echo
else
	printBattery "$statusBat0" "$capacityBat0"
	echo
fi
