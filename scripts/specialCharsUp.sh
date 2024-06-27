#!/bin/bash

selected_char=$(echo -e "É\nÈ\nÊ\nÀ\nÇ\nÔ\nÎ\n" | dmenu -nb '#1e1e1e' -sf '#1e1e1e' -sb '#b0b084' -nf '#b0b084' -p "Select a special character:") 

if [ -n "$selected_char" ]; then
    # Insert the selected character at the cursor position
    xdotool type "$selected_char"
fi
