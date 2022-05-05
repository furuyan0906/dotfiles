# language
#export LANG=ja_JP,UTF-8

# prompt in Terminal
PS1='%F{033}%[%033[36m%][%D %T]%[%033[0m%]%f %F{050}%d%f
$ '

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


## env varialbes

# vim & neovim
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config

# path
#export PATH="$HOME/.fzf/bin"

# fzf
#export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
#export FZF_DEFAULT_OPTS='--height 30% --border'
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


## alias

alias armgcc='arm-none-eabi-gcc'
alias armg++='arm-none-eabi-g++'

