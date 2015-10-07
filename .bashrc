#!/bin/bash
CRst="\[\033[0m\]" # remove color and formatting
CHigh="\[\033[1m\]" # Intensify the color
CBlue="\[\033[34m\]" # Color Blue
CWhite="\[\033[37m\]" # Color White
CRed="\[\033[31m\]" # Color Red

# terminal line formating
PS1="$CHigh$CRed┌─$CHigh$CWhite \u@\h: $CRst\w\n$CHigh$CRed└─$CWhite exec $ $CRst"

### Usefull functions ###

# Change directory and list its contents
cl() {
    cd "$1";
    ls;
}


### Aliases ###
alias em="emacs"
alias emnw="emacs -nw" # run terminal emacs
alias emcnw="emc -nw" # terminal emacs client
alias rm="rm -i" # ask before removing something
alias mv="mv -i" # ask before moving file
alias cp="cp -i" # ask before copying
alias ll="ls -l" # list files with properties
alias la="ls -a" # lists all files even the hidden ones
alias ..="cd .." # move a dir back
alias ~="cd ~" # move to home
alias ls="ls --color=auto --classify" # more descriptive ls
alias mkdir="mkdir -pv" # make parent dirs when making subdir
alias cls="clear" # windows prompt clear screen
alias listen="lsof -P -i -n" # list apps connected to network
alias hex_spam="cat /dev/urandom | hexdump -C | grep 'ca fe'"
alias cd..="cd .."
alias ..="cd .."

### ADD TO PATH ###

# include script folder to PATH
export PATH=/home/sasa/.scripts:$PATH

### GLOBAL VARIABLES ###
EDITOR="emacs -nw"; export EDITOR;
DEV_PATH="/home/sasa/Data/dev/"
TORRENT_PATH="/home/sasa/Data/Downloads/Torrent"
DOWNLOADS_PATH="/home/sasa/Data/Downloads"
### run some stuff ###

# init virtualenvwrapper for python
export WORKON_HOME=~/.virtualenvs
# for Ubuntu and it's derivatives wrapper is stored on
SH_FILE=/usr/local/bin/virtualenvwrapper.sh
if [ -f $SH_FILE ];
then
    source $SH_FILE;
fi
SH_FILE=/usr/bin/virtualenvwrapper.sh
if [ -f $SH_FILE ];
then
    # For Arch installations it's in a different location
    source $SH_FILE;
fi


# as background tilda will be the first terminal dont show
# screenfetch on it (if there is a easier way to check this
# mail me at savic-sasa@outlook.com)
#cmatrix -absC blue;
#screenfetch -tN;

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
