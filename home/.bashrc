#!/bin/bash
# ~/.bashrc

bash_main() {
# Load OS bash scripts
if [ -f /etc/bashrc ]; then # Redhat/Fedora
  . /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then # Debian/Ubuntu
  . /etc/bash.bashrc
  if [ -f /etc/profile.d/bash_completion.sh ]; then
    . /etc/profile.d/bash_completion.sh
  fi
fi

if [ -f $HOME/.dircolors ]; then
  eval $(dircolors -b $HOME/.dircolors)
fi

# User specific aliases and functions

# Set path
if ! [[ "$PATH" =~ "$HOME/.local/bin" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi

##### Environment Variables #####
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export COLUMNS="120"
HISTIGNORE="&:ls:ll:top:ps -ef"
HISTCONTROL=ignoreboth:ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=100000
HISTTIMEFORMAT='%F %T '
GLOBIGNORE=". .."

##### Aliases ##### 
alias ll='ls -l'
alias less='less -R'
alias today='date +%Y%m%d'
alias now='date +%Y%m%d%H%M'
alias susu="sudo -s HOME=$HOME CONTAINER_ID=$CONTAINER_ID"

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

##### Odd Shell Options #####
set -o vi
shopt -s extglob
shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend
shopt -u dotglob
shopt -s cmdhist
shopt -s histappend
umask 0022

##### Per term settings #####
case $TERM in 
  xterm*|tmux*|screen*)
    build_ps1
    ;;
  linux) 
    if [ -f /etc/vim/vimrc ]; then
      alias vim="vim -u /etc/vim/vimrc"
    fi
    TMOUT=3600
    ;;
  *)
    PS1='\h \$ '
    ;;
esac

##### man colors #####
export LESS_TERMCAP_mb=$'\e[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\e[1;34m'      # begin blink
export LESS_TERMCAP_so=$'\e[01;45;37m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[01;36m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'         # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'         # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'         # reset underline
export GROFF_NO_SGR=1                   # for konsole
}

##### Functions #####
deterministic_rand() {
  hosty=$1
  min=$2
  max=$3
  sum=$(sha256sum <<< $hosty | cut -d' ' -f1 | head -c 15)
  reduced=$(( ((16#$sum) % ( $max - $min )) + $min ))
  echo $reduced
}

build_ps1() {
  ## Build a PS1
  colorcode=$(deterministic_rand $(hostname -s | sed s/[0-9][0-9]$//) 22 231)
  PS_HOST="\[\e[01;38;5;${colorcode}m\]\h"
  TITLE_HOST="\h"
  if ! [[ -z $CONTAINER_ID ]]; then 
    colorcode=$(deterministic_rand $CONTAINER_ID 22 231)
    PS_HOST="$PS_HOST:\[\e[01;38;5;${colorcode}m\]${CONTAINER_ID}"
    TITLE_HOST="\h:${CONTAINER_ID}"
  fi
  if [ `whoami` == 'root' ]; then
    PS1="\[\e]0;${TITLE_HOST}\a\]\[\e[34;1m\]\w\n${PS_HOST}\[\e[31;1m\] # \[\e[0m\]"
  else
    PS1="\[\e]0;${TITLE_HOST}\a\]\[\e[34;1m\]\w\n${PS_HOST}\[\033[01;32m\] \$(parse_git_branch)\[\e[34;1m\]$ \[\e[0m\]"
  fi
}

pg() {
  ps -ef | grep $1
}

parse_git_branch() {
  if command -v git &> /dev/null; then
    ref=$(git symbolic-ref HEAD 2>/dev/null) || return
    echo "("${ref#refs/heads/}") "
  fi
}

get_dotfiles() {
  bash -c "$(wget -qO- https://git.io/JfKL9)"
}

ssh() {
  command ssh -t $@ '/bin/bash -c "$(if ! [ -d ~/.dotfiles ]; then wget -qO- https://git.io/JfKL9; fi)"; bash -l'
}

wmip() {
  curl ifconfig.co
}

dict () {
  curl dict://dict.org/d:$1 | less
}

weather () {
  curl wttr.in/chicago
}

bash_main
# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc
