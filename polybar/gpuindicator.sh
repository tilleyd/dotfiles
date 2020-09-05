#!/bin/bash

if lsmod | grep -q nvidia
then
    echo %{B#e06c75} GPU ON %{B#-}
else
    echo GPU OFF
fi
