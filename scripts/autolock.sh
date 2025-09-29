#!/bin/sh

#exec xautolock -detectsleep -time 1 -locker "/home/$USER/scripts/i3lock.sh" -notify 30 -notifier "notify-send -t 25000 -i /home/$USER/Pictures/locked_icon_small.png 'Auto-locking screen in 30 seconds...'"&

#export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
exec xidlehook \
  --not-when-fullscreen \
  --timer 540 \
    'notify-send -t 25000 -i /home/$USER/Pictures/locked_icon_small.png "Auto-locking screen in 30 seconds..."' \
    '' \
  --timer 30 \
    '"/home/$USER/scripts/i3lock.sh"' \
    '' 
