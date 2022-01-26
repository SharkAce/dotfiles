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


# Put your fun stuff here.
PS1='\[\e]0;\u@\h: \w\a\]╭\[ \033[m\]|\[\033[1;33m\]\t\[\033[m\]|\[\e[1;32m\]\u\[\e[m\]:\[\e[0m\]\[\e[1;36m\][\W]\[\e[0m\]\n╰─> '
source ~/.bash_aliases
export EDITOR=vim
set -o vi

