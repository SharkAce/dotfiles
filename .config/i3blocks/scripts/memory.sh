#!/bin/bash

used_memory=$(free -m | awk 'NR==2{printf "%.0f", ($3/$2)*100}')

if [ $used_memory -gt 75 ];then
	sec_icon=' '
fi

# Print the formatted output
echo "$sec_icon $used_memory%"

