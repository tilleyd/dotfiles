#!/bin/bash

echo -n %{F#9259ff}[%{F-}

if playerctl status > /dev/null 2> /dev/null
then
    if playerctl metadata | grep -i spotify > /dev/null
    then
        echo -n " %{F#8FC468}%{F-}"
    fi
    if playerctl status | grep Playing > /dev/null
    then
        echo -n "  "
    else
        echo -n "  "
    fi
    printf "%s - %s " "`playerctl metadata artist`" "`playerctl metadata title`"
else
    printf "  "
fi

echo %{F#9259ff}]%{F-}
