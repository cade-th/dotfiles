
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias teams='surf https://teams.microsoft.com/v2/'
alias outlook='surf https://outlook.office365.com/mail/'
alias chat='surf https://chatgpt.com/'
alias reddit='surf https://www.reddit.com/'

alias battery="upower -i $(upower -e | grep 'BAT') | grep -E 'percentage' | awk '{print \$2}'"

alias endure='cd ~/jobs/EndurID_Inmate_Tag'
alias d='cd ~/dotfiles'

alias em='/usr/share/segger_embedded_studio_for_arm_5.10a/bin/emStudio'

alias printOdic='lp'
alias ss='scrot -s'


alias c='clear'
alias v='nvim'
alias explore='thunar'

alias b='source .bashrc'
