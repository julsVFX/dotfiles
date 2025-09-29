#!/bin/bash
#revert() {
#  rm /tmp/*screen*.png
#  xset dpms 0 0 0
#}
#trap revert HUP INT TERM
#xset +dpms dpms 0 0 5

screen_file="/tmp/locking_screen.png"
rm -f "$screen_file"

monitors=$(xrandr -q | grep " connected" | cut -d '+' -f1 | rev | cut -d ' ' -f1 | rev)

if [[ $(echo "$monitors" | wc -l) -gt 1 ]]; then
	~/bin/i3lock-fancy/i3lock-fancy-dualmonitor	$monitors
	echo "dual monitors"
	#~/scripts/i3lock_mm.sh -i ~/.config/awesome/themes/powerarrow-dark/lock.png
else
	scrot -q 10000 "$screen_file";
	convert "$screen_file" -brightness-contrast -50x-50 -resize 512 miff:- | convert miff:- -blur 0x7 -resize 1920x1080 miff:- | convert miff:- ~/Pictures/locked_icon.png -gravity center -compose over -composite /tmp/screen.png; #-paint 2
	i3lock -i /tmp/screen.png
fi

