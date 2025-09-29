#!/bin/bash

# Get all X11 window IDs of scratchpad windows
i3-msg -t get_tree \
  | jq -r '.. | objects | select(.name == "__i3_scratch") 
            | .. | objects | select(has("window")) 
            | .window' \
  | while read -r winid_dec; do
      # Convert decimal ID to hex (xprop wants hex with 0x prefix)
      winid_hex=$(printf "0x%X" "$winid_dec")
      # Set skip_taskbar
      xprop -id "$winid_hex" \
        -f _NET_WM_STATE 32a \
        -set _NET_WM_STATE _NET_WM_STATE_SKIP_TASKBAR
    done
