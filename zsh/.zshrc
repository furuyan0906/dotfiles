# ----- [Language] -----
export LANG=ja_JP,UTF-8

# ----- [Prompt] -----
PS1='%F{027}%[%033[36m%][%D %T]%[%033[0m%]%f %F{050}%d%f
$ '

# ----- [Env varialble] -----

# ----- [[vim]] -----
XDG_CACHE_HOME=$HOME/.cache
XDG_CONFIG_HOME=$HOME/.config

# ----- [alias] -----

# ----- [[ssh]] -----
alias piConnect='ssh pi@192.168.11.12'
alias nanoConnect='ssh nano@192.168.11.9'

# ----- [[VIM (brewed)]] -----
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/ucurses/bin:$PATH"
export PATH="$PATH:$HOME/.fzf/bin"

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
