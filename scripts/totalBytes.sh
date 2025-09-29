#!/bin/bash 

let TotalBytes=0

for Bytes in $(ls -l | grep "^-" | awk '{ print $5 }')
do
   let TotalBytes=$TotalBytes+$Bytes
done

# The if...fi's give a more specific output in byte, kilobyte, megabyte, 
# and gigabyte

if [ $TotalBytes -lt 1024 ]; then
   TotalSize=$(echo -e "scale=3 \n$TotalBytes \nquit" | bc)
   suffix="b"
elif [ $TotalBytes -lt 1048576 ]; then
   TotalSize=$(echo -e "scale=3 \n$TotalBytes/1024 \nquit" | bc)
   suffix="kb"
elif [ $TotalBytes -lt 1073741824 ]; then
   TotalSize=$(echo -e "scale=3 \n$TotalBytes/1048576 \nquit" | bc)
   suffix="Mb"
else
   TotalSize=$(echo -e "scale=3 \n$TotalBytes/1073741824 \nquit" | bc)
   suffix="Gb"
fi

echo -n "${TotalSize}${suffix}"