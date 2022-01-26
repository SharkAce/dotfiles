export LOW_BAT=15

feh --bg-fill ~/wallpaper/gruvbox_wave.png
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
unclutter -root -idle 3 &
exec picom &
~/scripts/battery_warning.sh &
exec i3
