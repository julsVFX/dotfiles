#!/bin/bash

PREV_TOTAL=0
PREV_IDLE=0

while true; do
    CPU=($(head -n1 /proc/stat))
    IDLE=${CPU[4]}

    TOTAL=0
    for VALUE in "${CPU[@]:1}"; do
        TOTAL=$((TOTAL + VALUE))
    done

    DIFF_IDLE=$((IDLE - PREV_IDLE))
    DIFF_TOTAL=$((TOTAL - PREV_TOTAL))
    DIFF_USAGE=$(( (1000 * (DIFF_TOTAL - DIFF_IDLE) / DIFF_TOTAL + 5) / 10 ))

    # Print just the percentage number (0–100)
    echo "$DIFF_USAGE"

    PREV_TOTAL=$TOTAL
    PREV_IDLE=$IDLE

    sleep 2
done
