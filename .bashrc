# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\e[48;2;81;207;102m\] \[\e[0m\]\[\e[48;2;255;255;255m\] \[\e[0m\]\[\e[48;2;255;0;0m\] \[\e[0m\]\$>'

xbindkeys
