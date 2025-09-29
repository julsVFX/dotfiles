#!/bin/bash

DIR='/home/julius/Documents/notes'
SHEET=$(ls -l "$DIR" | egrep ^- | rev | cut -d ' ' -f1 | rev | dmenu -l 100 -p "Cheatsheet:" -fn "-xos4-terminus-medium-r-*-*-15-*")
if [ -n "$SHEET" ]; then
  #exec i3-msg [class="^Firefox$"] focus
  pluma "${DIR}/${SHEET}" 2> /dev/null
fi
