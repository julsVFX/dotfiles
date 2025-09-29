#!/bin/bash

#COLORS
BLACK="\[\033[0;30m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
PURPLE="\[\033[0;35m\]"
BROWN="\[\033[0;33m\]"
LIGHTGRAY="\[\033[0;37m\]"

DARKGRAY="\[\033[1;30m\]"
LIGHTBLUE="\[\033[1;34m\]"
LIGHTGREEN="\[\033[1;32m\]"
LIGHTCYAN="\[\033[1;36m\]"
LIGHTRED="\[\033[1;31m\]"
LIGHTPURPLE="\[\033[1;35m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
NO_COLOUR="\[\033[0m\]"


#LOAD
loadNumMin=160
loadNumMax=190
loadSteps=6
loadNumAdd=$(( $loadNumMin+$loadNumMax ))

load=`cat /proc/loadavg | cut -d " " -f1`
procNum=`nproc`
loadPerc=`echo "100*$load/$procNum" | bc`
loadForCol=`echo "$procNum-$load*0.91" | bc | sed 's/^-.*/0/'` #inverted to match color gradiant and make sure its not negative
steps=`bc <<< "scale=2; $procNum/$loadSteps"`
mult=`bc <<< "scale=2; $loadForCol/$steps" | sed 's/^\./0./' | cut -d "." -f1` #sed part for leading 0's

loadCol=$(( $loadNumMin + $mult*$loadSteps ))
if [[ $loadCol > $loadNumMax ]]; then
  loadCol=$loadNumMax;
fi
loadColTCSH="%{\033[38;5;${loadCol}m%}"

tcshSHOW="$SHOW"
tcshSHOT="$SHOT"

#print in tcsh prompt:
#echo "%{$loadColTCSH%}${loadPerc}%%"
echo "\[%{$loadColTCSH%}%{$loadPerc%}%%"
