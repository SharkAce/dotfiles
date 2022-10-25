#!/bin/bash
max_bright=$(brightnessctl m)
current_bright=$(brightnessctl g)
pct=$(( ($current_bright * 100) / $max_bright ))
echo $pct% 
