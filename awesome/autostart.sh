#!/usr/bin/env bash

# Avoid running programs twice after reloading the awesome rc
function checkrun {
    if ! pgrep -f $1 ;
    then
        $@ &
    fi
}

checkrun picom
checkrun nm-applet
#checkrun cbatticon
