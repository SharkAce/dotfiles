#!/bin/bash
xrdb -load ~/.Xresources
img=$(sxiv -trqo ~/wallpapers/* | head -n 1)
wal -i $img

