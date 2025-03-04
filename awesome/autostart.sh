#!/usr/bin/env bash

# Avoid running programs twice after reloading the awesome rc
function checkrun {
    if ! pgrep -f $1 ;
    then
        $@ &
    fi
}

# disable screen blanking
xset dpms 0 0 0 && xset -dpms && xset s noblank && xset s off

# set screen setup
xrandr --output DP-0 --mode 2560x1440 --rate 165

checkrun picom
checkrun nm-applet
checkrun cbatticon
checkrun dropbox
