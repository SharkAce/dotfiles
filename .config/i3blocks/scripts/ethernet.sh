#!/bin/bash

# Get the name of the Ethernet interface
interface="enp0s31f6"

# Check if the interface is up
if ip addr show $interface | grep -q "inet"; then
    echo "󰈀"
else
    echo "󰈂"
fi

