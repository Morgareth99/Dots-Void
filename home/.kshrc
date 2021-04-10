#!/usr/bin/env ksh

# skip this setup for non-interactive shells
[[ -o interactive && -t 0 ]] || return

source  /home/morgareth/.sh.d/functions.ksh
source  /home/morgareth/.sh.d/aliases.ksh
#. /home/morgareth/.profile

# Load any supplementary scripts

HISTFILE=$HOME/.sh.d/.history
HISTSIZE=4096
CDPATH=.:$HOME:/

#PS1="$(printf "\033[m$USER\33[34m@\33[33m`hostname` \033[34m✗ \n\\033[34m>>>\033[0m ")"
PS1="$(printf "\033[1;31m$USER \033[31m♥ \033[34m~ \33[0m ")"


# Turns background jobs at a lower priority.
set -o bgnice

# Turns on command completion in the shell.
set cmdcomplete

# changes the <tab> character into a file name completion character.
set tabcomplete

#Specifies emacs style in-line editor for command entry.
set -o emacs

# don't save function defs in history (have to think about this)
set -o nolog

# csh-style history (have to think about this, on for now)
set -o histexpand

# turn off multiline mode ref: https://github.com/ksh93/ksh/issues/71
set +o multiline

# don't exit on ctrl-d
set -o ignoreeof

# Disable core dumps
ulimit -c 0

# syntax coloring
#git clone https://github.com/arcticicestudio/nord-dircolors && ln -sr nord-dircolors/src/dir_colors ~/.dir_colors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

stty -ixon -ctlecho;
tabs -4;

# Custom Functions
#git_branch_name(){
#val=`git branch 2>/dev/null | grep '^*' | colrm 1 2`
#echo "$val"
#}

