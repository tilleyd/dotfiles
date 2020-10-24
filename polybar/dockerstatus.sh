#!/bin/bash

NumPs=$(docker ps | wc -l)
NumPs=`expr $NumPs - 1`

if docker ps > /dev/null 2> /dev/null
then
    echo %{F#9259ff}[%{F-}  $NumPs %{F#9259ff}]%{F-}
else
    echo %{F#9259ff}[%{F-} %{F#FE6D82}%{F-} %{F#9259ff}]%{F-}
fi

