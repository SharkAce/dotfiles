# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Color 	Code
# 
# Black 	0;30
# Blue 	  0;34
# Green 	0;32
# Cyan 	  0;36
# Red 	  0;31
# Purple 	0;35
# Brown 	0;33

# Put your fun stuff here.
PS1='\[\e]0;\u@\h: \w\a\]╭\[ \033[m\]|\[\033[1;36m\]\t\[\033[m\]|\[\e[1;34m\]\u\[\e[m\]:\[\e[0m\]\[\e[1;35m\][\W]\[\e[0m\]\n╰─> '
source ~/.bash_aliases
export EDITOR=vim
set -o vi
alias hello="echo hello world"

export HISTSIZE=-1
export HISTFILESIZE=-1
