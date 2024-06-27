#!/bin/bash

# Path to the emerge log
emerge_log="/var/log/emerge.log"

# Get the current date in seconds since the epoch
current_date=$(date +%s)

# Find the last emerge time of sys-apps/portage in the emerge log
# and convert it to seconds since the epoch
last_emerge_time=$(grep "<<< sys-apps/portage" "$emerge_log" | tail -1 | awk '{print $1}')

# If we didn't find the emerge time, exit
if [ -z "$last_emerge_time" ]; then
    echo "The emerge time for sys-apps/portage could not be found."
    exit 1
fi

# Convert the last emerge time to a readable format (optional)
# Useful for debugging or logging
last_emerge_date=$(date -d "@$last_emerge_time" '+%Y-%m-%d %H:%M:%S')

# Calculate the difference in days
difference=$(( (current_date - last_emerge_time) / 86400 ))

# Check if the difference is more than 7 days
if [ "$difference" -gt 7 ]; then
    echo "The last emerge of sys-apps/portage was more than a week ago (last emerge: $last_emerge_date)."
else
    echo "The last emerge of sys-apps/portage was within the last week (last emerge: $last_emerge_date)."
fi

