#!/bin/bash

status=$(synclient | grep Touchpad | sed 's/\ //g' | cut -d '=' -f2)

if [[ $status == 0 ]]; then
    synclient TouchpadOff=1
elif [[ $status == 1 ]]; then
    synclient TouchpadOff=0
else
    echo 'status not found'
fi