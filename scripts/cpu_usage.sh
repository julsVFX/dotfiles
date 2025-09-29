#!/bin/sh
cpu=$(mpstat 1 1 | awk '/^Average/{printf "%3d", 100-$NF}')

echo "/home/julius/.icons/extra/cpu_anim/cpu_anim.$(echo $cpu | tr -d ' ').png"
#echo "$cpu%"
