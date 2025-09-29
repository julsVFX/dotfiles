#!/bin/bash

URL='https://www.google.com/search?q='
QUERY=$(echo '' | dmenu -p "Google:" -fn "-xos4-terminus-medium-r-*-*-15-*")
if [ -n "$QUERY" ]; then
  firefox -new-window "${URL}${QUERY}" 2> /dev/null
  #exec i3-msg [class="^Firefox$"] focus
fi
