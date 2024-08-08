feh --bg-fill --bg-max ~/wallpaper/gruvbox_wave.png
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
unclutter -root -idle 3 &
picom &
exec dbus-run-session i3
