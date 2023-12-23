#!/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d '.' -f1)

if [ $cpu_usage -gt 75 ]; then
	sec_icon=' '
fi

# Print the formatted output
echo "$sec_icon $cpu_usage%"

