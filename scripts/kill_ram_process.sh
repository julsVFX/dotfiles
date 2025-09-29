#!/bin/bash

# Step 1: Get the process list with memory usage and format it into an array
process_list=()
while IFS= read -r line; do
  pid=$(echo "$line" | awk '{print $1}')
  mem=$(echo "$line" | awk '{print $2}')
  command=$(echo "$line" | awk '{$1=""; $2=""; print $0}' | sed 's/^ *//')
  process_list+=("$pid" "$mem" "$command")
done < <(ps -ax --no-headers --format=pid,rss,command --sort=-rss,pid | head -10 | \
awk 'BEGIN{suffixes_len=split("kB MB GB TB",suffixes)} {n_suffix=1; while($2 > 1000 && n_suffix < suffixes_len) {$2 /= 1024; n_suffix++;}; printf "%s %.2f%s %s\n",$1,$2,suffixes[n_suffix],substr($0, index($0,$3))}')

# Step 2: Show Zenity list dialog
selected=$(zenity --list --title="Highest RAM Consumption" --text="Select a process to kill" \
  --column="PID" --column="Memory" --column="Process" \
  --width=800 --height=400 \
  "${process_list[@]}")

# Step 3: Kill the selected process
if [[ -n "$selected" ]]; then
  pid=$(echo "$selected" | awk '{print $1}')
  kill -9 "$pid" 2>/dev/null;
fi

