#!/bin/sh
mem=$(free -t | awk 'NR == 2 {printf "%3d", $3/$2*100}')

echo "/home/julius/.icons/extra/mem_anim/mem_anim.$(echo $mem | tr -d ' ').png"
#echo "$mem%"


