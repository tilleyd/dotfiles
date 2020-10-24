#!/bin/bash

if lsmod | grep -q nvidia
then
    echo -n %{F#9259ff}[%{F-}  
    nvidia-smi -q -d UTILIZATION | awk '
        BEGIN { ORS=" " };
        $1=="Gpu"{printf(" %-4s", $3"%")};
        ($1=="Memory" && $2 != "Utilization"){printf "  %-4s ", $3"%"}'
    echo %{F#9259ff}]%{F-}
else
    echo %{F#9259ff}[%{F-} %{F#FE6D82}  %{F#-} %{F#9259ff}]%{F-}
fi
