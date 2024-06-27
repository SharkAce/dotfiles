#!/bin/bash

let "level = $(brightnessctl g) * 100 / $(brightnessctl m)"

echo "󰛨 $level%"
