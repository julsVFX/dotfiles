#!/bin/sh
gpu=$(nvidia-smi | egrep -o '[0-9]{1,3}% *Default' | cut -d ' ' -f1 | awk '{printf "%4d", $1}')
echo "/home/julius/.icons/extra/gpu_anim/gpu_anim.$(echo $gpu | tr -d ' ').png"
#echo "$gpu%"
