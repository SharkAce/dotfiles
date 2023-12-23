#!/bin/bash

# Get the name of the Wi-Fi interface
interface="wlp4s0"

# Check if the interface is up
if ip addr show wlp4s0 | grep -q "inet"; then
    echo ""  # Your connected icon
else
    echo "󰖪"  # Your not connected icon
fi

