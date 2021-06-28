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

checkrun picom
checkrun nm-applet
#checkrun cbatticon
