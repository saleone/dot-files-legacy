# Use this file to store history
HISTFILE=~/.histfile

# Number of commands to store in history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd

# Don't do sound warnings
unsetopt beep

# Set up python virtualenv
export WORKON_HOME=~/.venvs
if [[ -f "/usr/bin/virtualenvwrapper.sh" ]];
then
    source /usr/bin/virtualenvwrapper.sh
elif [[ -f /usr/local/bin/virtualenvwrapper.sh ]];
then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Git prompt
source ~/.zsh-git-prompt/zshrc.sh
ZSH_THEME_GIT_PROMPT_PREFIX=" %b[%B${fg_bold[white]}git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]%b"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[red]%}%{✔%G%}"

# Virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=" [${fg_bold[white]}workon:${fg_bold[red]}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%b]"

function virtualenv_prompt_info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        echo "$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX$name$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"
    fi
}

PROMPT='[${fg_bold[red]}%n${fg_bold[white]}@${fg_bold[red]}%M%b] [${fg_bold[white]}cwd:${fg_bold[red]}%~%b]$(git_super_status)$(virtualenv_prompt_info)
%B${fg_bold[white]}➤%b '

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
EDITOR="emacs"; export EDITOR;
DEV_PATH="/home/sasa/Data/dev/"
TORRENT_PATH="/home/sasa/Data/Downloads/Torrent"
DOWNLOADS_PATH="/home/sasa/Data/Downloads"

# Virtualenvwrapper setup (installed via package manager)
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev/
