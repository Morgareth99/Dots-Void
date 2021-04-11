#################################################
#  ____    ____   _____ __ __  ____      __     #
# |    \  /    T / ___/|  T  T|    \    /  ]    # 
# |  o  )Y  o  |(   \_ |  l  ||  D  )  /  /     #
# |     T|     | \__  T|  _  ||    /  /  /      #
# |  O  ||  _  | /  \ ||  |  ||    \ /   \_     #
# |     ||  |  | \    ||  |  ||  .  Y\     |    # 
# l_____jl__j__j  \___jl__j__jl__j\_j \____j    #
#################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Pkgfile includes a "command not found" hook for Bash and Zsh that will automatically search the official repositories, when entering an unrecognized command:
#  source /usr/share/doc/pkgfile/command-not-found.bash

#Syntax coloring# wget https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolors
eval $(dircolors -b $HOME/.dircolors)

# Don't put duplicate lines or lines starting with space in the history.
# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# Date and Timestamp in history
#Restrict bash history to unique commands, no duplicates
HISTCONTROL=ignoreboth,erasedups
HISTSIZE=1000
HISTFILESIZE=2000 
HISTTIMEFORMAT='%F %T  '
HISTFILE=~/.bash_history

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
   fi
fi 

#make tab cycle through commands after listing
bind 'TAB':menu-complete
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"
bind "set menu-complete-display-prefix on"

# Append to the history file, don't overwrite it
# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# Report status of terminated background jobs immediately.
# Auto cd 
# Expanded globbing (i.e. allow 'ls -d ^*.jpg' to show  non-jpg files)
# Mispelled directory names
# Require '>|' instead of '>' to overwrite a file
# Correct spelling on directory names during  globbing
set -o noclobber
set -o notify 
shopt -s checkwinsize
shopt -s cdspell 
shopt -s autocd
shopt -s histappend
shopt -s extglob
shopt -s cdspell         
shopt -s dirspell 
shopt -s expand_aliases

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
    fi

# Bash Functions File
if [ -f ~/.bash_functions ]; then
. ~/.bash_functions
fi

#Complete
complete -c man which
complete -cf doas

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)" 

# fuzzy completion
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

# Autojump 
source /etc/profile.d/autojump.sh  

# Coloring the output of various programs
GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
then
    alias colourify="$GRC -es --colour=auto"
    alias cfg='colourify ./configure'
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make' 
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
    alias head='colourify head'
    alias tail='colourify tail'
    alias dig='colourify dig'
    alias mount='colourify mount'
    alias ps='colourify ps'
    alias mtr='colourify mtr'
    alias df='colourify df'

fi

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}


PS1="\[\e[1;31m\]•\e[31m\] • \e[1;33m\]•\[\e[1;32m\] •\[\e[35m\]\n:: \[\e[32m\]\$(parse_git_branch)\[\e[00m\] "

