#!/bin/bash

volume=$(amixer get Master | awk -F '[][]' '/%/ {print $2}' | head -n1)

# Check if muted
if amixer get Master | grep -q "\[off\]"; then
    icon="󰖁"
else
    icon="󰕾"
fi

echo "$icon $volume"
