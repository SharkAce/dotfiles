export LOW_BAT=5

~/.fehbg &
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
unclutter -root -idle 3 &
exec picom &
~/scripts/battery_warning.sh &
exec i3
source ~/scripts/theme.sh
