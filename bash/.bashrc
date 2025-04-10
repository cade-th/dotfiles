#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/dotfiles/bash/.bash_aliases

PS1='[\u@\h \W]\$ '

set -o vi
. "$HOME/.cargo/env"


export STM32_PRG_PATH=/home/cade/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin
. "/home/cade/.deno/env"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
