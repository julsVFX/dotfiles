#!/bin/sh

while true; do
    width=166 #173   
    procs="$(ps -eo args)"

    echo "$procs" | grep -q "/steam.sh" && width=$((width-8))
    echo "$procs" | grep -q "/opt/zoom" && width=$((width-8))
    echo "$procs" | grep -q "simplescreenrecorder" && width=$((width-8))

    printf 'echo "%*s"\n' "$width" "" > ~/scripts/tint2_space_clock.sh
    sleep 1
done
