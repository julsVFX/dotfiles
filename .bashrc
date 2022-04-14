# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

shopt -s histappend

################
#PROMPT
################
source ~/prompt.sh


################
# ENV
################
export TERM='screen-256color'
#source /usr/share/doc/libopencolorio-dev/examples/setup_ocio.sh
#export OCIO="~/ocio/aces_1.0.3/config.ocio"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/DJV/lib/
export PYTHONPATH=${PYTHONPATH}:/usr/local/USD/lib/python
export ARNOLD_HOME=/opt/solidangle/mtoa/2019/
export ARNOLD_ROOT=/opt/Autodesk/arnold/7.0.0.3/ #/opt/solidangle/arnold-6.1.0.1/
export ARNOLD_PATH=$ARNOLD_ROOT
export ARNOLD_PLUGIN_PATH=/home/$USER/shaders/osl:/home/$USER/shaders/arnold:/home/$USER/bin/arnold-usd/procedural/:/home/$USER/bin/gaffer-0.61.3.0-linux-python2/arnold/plugins/
export RMSTREE=/opt/pixar/RenderManForMaya-22.4
export RMANTREE=/opt/pixar/RenderManProServer-22.4
export RMANFB=it 
export MAYA_PLUG_IN_PATH=$RMSTREE/plug-ins
export MAYA_SCRIPT_PATH=$RMSTREE/scripts
export MAYA_MODULE_PATH=$RMSTREE/etc:$ARNOLD_HOME
export MAYA_RENDER_DESC_PATH=$ARNOLD_HOME
export XBMLANGPATH=”$RMSTREE/icons/%B” 
export PATH=$PATH:${RMANTREE}/bin:${RMSTREE}/bin:$ARNOLD_HOME/bin:/usr/local/USD/bin:/home/$USER/bin/gaffer-0.53.4.0-linux/bin/:/usr/local/USD/bin
export solidangle_LICENSE=5053@localhost
#export OCIO="$HOME/OCIO/imageworks-OpenColorIO-Configs-84425e4/spi-vfx/config.ocio"
export EDITOR=pluma
export TMUX=''
QT_QPA_FONTDIR=/usr/share/fonts/truetype


#tmux
tmux source ~/.tmux.conf

################
#ALIASES
################

#apps
alias gaffer='~/bin/gaffer-0.61.3.0-linux-python2/bin/gaffer'
alias natron='/opt/Natron2/Natron'
alias katana='~/.katanaLauncher.sh'
alias mari='/usr/local/Mari4.2v1/mari --nc'
alias nuke='/usr/local/Nuke13.1v1/Nuke13.1 --nc'
alias krita='/opt/Krita/krita-4.1.7-x86_64.appimage'
alias photoscan='export PSHOME=/opt/photoscan/1.3.4.5067 export QT_PLUGIN_PATH=$PSHOME && export LD_LIBRARY_PATH=/usr/lib:$PSHOME && $PSHOME/photoscan'
alias houdini='cd /opt/hfs19.0 && source houdini_setup_bash && houdini'
alias blender='/opt/blender/blender'
alias r='/opt/resolve/bin/resolve'
alias djv='/usr/local/DJV2/bin/djv.sh'
alias ue='~/bin/UnrealEngine/Engine/Binaries/Linux/UE4Editor'
alias pureref='~/bin/PureRef-portable-1.9.2_x64'
alias sbl='/opt/sublime_text/sublime_text'
alias ev='expressvpn'
alias t='mate-terminal -e tmux'
alias c='mate-calc'


#useful unixy things
alias ls='ls --color=auto'
alias ll='ls -lh'
alias ltr='ls -ltrh'
alias j='jobs -l'
alias d='dirs -v'
alias rr='sudo service NetworkManager restart'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dusch='du -sch .[!.]* * | sort -h'
alias qdl='wget -U QuickTime/7.6.4 '
alias ka='killall -9 '
alias hg='history | grep $1'
alias h='history'
alias f='find 2>&1 | egrep -i '
alias syi='sudo apt-get install ' #'sudo yum install '
alias syl='sudo dpkg -i ' #'sudo yum localinstall'
alias syu='sudo apt-get update ' #'sudo yum update '
alias k1='kill -9 %1'
alias k2='kill -9 %2'
alias k3='kill -9 %3'
alias k4='kill -9 %4'
alias k5='kill -9 %5'
alias psg='ps ax | grep '
alias am=alsamixer
alias ct='export EDITOR=nano && crontab -e'
alias dry="pluma ~/Documents/Microsoft\ User\ Dataold/PowerPoint\ Script\ Menu\ Items/.dry";

#user scripts
alias setbeamer='~/Documents/bash_playground/./set_beamer.sh'
alias unsetbeamer='~/Documents/bash_playground/./unset_beamer.sh'
alias playlist_shuffle='sh ~/Documents/playlist_shuffle.sh'
alias resource='source ~/.bashrc'
alias gpc='mkdir transcoded; for i in *.MP4; do ffmpeg -i $i -vcodec mjpeg -q:v 2 -acodec pcm_s16be -q:a 0 -f mov transcoded/${i%.*}.mov; done'
alias notflix='~/bin/notflix/notflix'


#awesome specific
alias ear='pluma ~/.config/awesome/rc.lua&'
alias eat='pluma ~/.config/awesome/themes/powerarrow-dark/theme.lua&'
alias ba='mv -v awesome{,BAK}'
alias unba='mv -v awesome{BAK,}'
alias arr='echo "awesome.restart()" | awesome-client'
alias ac='cd ~/.config/awesome/'
alias axt='Xephyr -br -ac -noreset -screen 1152x720 :1 & sleep 2 ; DISPLAY=:1 awesome'

#update clock
alias uc='systemctl restart chronyd'
alias set_time='sudo ntpd -qg'



################
#FUNCTIOONS
################
mkw() {
    sudo chmod 775 -R "$1" 
    sudo chown $USER -R "$1"
}

cas() { c++ $1 -o `echo $1 | sed 's/\.cpp/\.so/g'` -Wall -O2 -shared -fPIC -I$ARNOLD_PATH/include -L$ARNOLD_PATH/bin -lai; }
lss() { ls $1 | grep -Eo '[0-9]{2,}|[^0-9]{2,}' | paste - - - | grep -E '[0-9]{2,}' | awk '{ printf "%s%s%s\n", $1, "%0"length($2)"d", $3 }' | uniq; };

cdp() { [[ "$#" == 1 ]] && cd $(dirs -l | cut -d " " -f $(($1+1)) ); };


function git_sparse_clone() (
  rurl="$1" localdir="$2" && shift 2

  mkdir -p "$localdir"
  cd "$localdir"

  git init
  git remote add -f origin "$rurl"

  git config core.sparseCheckout true

  # Loops over remaining args
  for i; do
    echo "$i" >> .git/info/sparse-checkout
  done

  git pull origin master
)


