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
function prompt_command()
{
  #exit status color
  EXIT="$?"
  [[ $EXIT == 0 ]] && status_col=$NO_COLOUR || status_col=$RED


  #system load
  loadNumMin=160
  loadNumMax=190
  loadSteps=6
  loadNumAdd=$(( $loadNumMin+$loadNumMax ))

  load=`cat /proc/loadavg | cut -d " " -f1` 
  procNum=`nproc`
  loadPerc=`echo "100*$load/$procNum" | bc`
  loadForCol=`echo "$procNum-$load*0.5" | bc | sed 's/^-.*/0/'`  #inverted to match color gradiant and make sure its not negative
  steps=`bc <<< "scale=2; $procNum/$loadSteps"`
  mult=`bc <<< "scale=2; $loadForCol/$steps" | sed 's/^\./0./' | cut -d "." -f1` #sed part for leading 0's

  loadCol=$(( $loadNumMin + $mult*$loadSteps ))
  if [[ $loadCol > $loadNumMax ]]; then
    loadCol=$loadNumMax;
  fi


  #PROMPT
  export PS1="${status_col}┌[$BROWN\!$NO_COLOUR::\e[38;5;\${loadCol}m\${loadPerc}%$NO_COLOUR::$CYAN\j${status_col}]-[$LIGHTGREEN\u$NO_COLOUR@$LIGHTBLUE\h${status_col}]\n${status_col}├$NO_COLOUR\$PWD\n${status_col}└> $NO_COLOUR"
}
PROMPT_COMMAND=prompt_command



#┌—
#└[#1]>
#PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\]"

#PROMPT_COMMAND='history -a;echo -en "\033[m\033[38;5;2m"$(( `sed -n "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo`/1024))"\033[38;5;22m/"$((`sed -n "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo`/1024 ))MB"\t\033[m\033[38;5;55m$(< /proc/loadavg)\033[m"' \
#PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '
