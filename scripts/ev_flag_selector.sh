#!/bin/bash
flag_dir="/home/$USER/Pictures/flag-icons-main/flags/4x3"

status=$(expressvpn status | egrep "Connected to " | sed 's/Connected to //g' | sed 's/\x1b\[[0-9;]*m//g')

if [[ ! -z $status ]]; then
    country_code=$(expressvpn list all | grep "$status" | cut -c1-2)
    echo "$flag_dir/$country_code.svg"
else
    echo "$flag_dir/de.svg"
fi;
