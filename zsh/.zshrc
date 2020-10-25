# language
#export LANG=ja_JP,UTF-8

# prompt in Terminal
PS1='%F{033}%[%033[36m%][%D %T]%[%033[0m%]%f %F{050}%d%f
$ '

# path
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/ucurses/bin:$PATH"
#export PATH="$HOME/.fzf/bin"

# vim & neovim
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config

# fzf
#export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
#export FZF_DEFAULT_OPTS='--height 30% --border'
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ssh
alias pi='ssh pi@192.168.11.12'
alias jnano='ssh nano@192.168.11.9'

alias vim='nvim'

alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew'
