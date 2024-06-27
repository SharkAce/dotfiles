#!/bin/bash

last_notif=$(tail -3 ~/.notification)
echo "$last_notif"

# Check if the block is clicked
if [[ ! -z "$BLOCK_BUTTON" ]]; then
    # Clear the contents of ~/.notification on left-click
		head -n -3 ~/.notification > ./tmp && mv ./tmp ~/.notification

fi

