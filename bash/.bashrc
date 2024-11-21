#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/dotfiles/bash/.bash_aliases

PS1='[\u@\h \W]\$ '

set -o vi
. "$HOME/.cargo/env"
