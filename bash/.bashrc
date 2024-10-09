#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/dotfiles/bash/.bash_aliases

export PATH=$PATH:/usr/share/segger_embedded_studio_for_arm_5.10a/bin
export PATH=$PATH:/appimages/
PS1='[\u@\h \W]\$ '


set -o vi
