# -----------------------------------------------------------------------------------------------------------------------------------
# Language

# 日本語設定
export LANG="ja_JA.UTF-8"
export LESSCHARSET=utf-8


# -----------------------------------------------------------------------------------------------------------------------------------
# History

HISTFILE=$HOME/.zsh_history  # 履歴を保存するファイル
HISTSIZE=1000                # メモリ上に保存する履歴のサイズ
HISTFILESIZE=2000            # 上述のファイルに保存する履歴のサイズ

# 実行時に履歴をファイルに保存する
setopt inc_append_history

# 履歴を他のシェルとリアルタイム共有する
# setopt share_history


# -----------------------------------------------------------------------------------------------------------------------------------
# Complementation

# 補完を有効にする
autoload -Uz compinit && compinit

# 補完候補をそのまま探す
# 小文字を大文字に変えて探す. 大文字を小文字に変えて探す.
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# 補完方法毎にグループ化する.
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''

# 補完侯補をメニューから選択する.
# select=2: 補完候補を一覧から選択する, 補完候補が2つ以上なければすぐに補完する.
zstyle ':completion:*:default' menu select=2


# -----------------------------------------------------------------------------------------------------------------------------------
# Misc

# プロンプトの設定
# ユーザ名@ホスト名:カレントディレクトリ [yy-mm-dd hh:mm:ss]
export PS1='%F{050}%n@%M:%~%f %F{033}[%W %*]%f
$ '

# ディレクトリ名を入力したら自動でディレクトリを変更する
# setopt auto_cd

# ctrl-s, ctrl-qを禁止する
setopt no_flow_control

# Bash同様のaliasを定義する
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'


# -----------------------------------------------------------------------------------------------------------------------------------

export PATH=$PATH:/usr/local/cuda/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/Library/lib:/usr/local/cuda/lib64

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

export SCREENDIR=$HOME/.screen

# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
export DISPLAY=$(ipconfig.exe | grep "IPv4" | head -1 | awk '{print $NF}' | awk 'sub(/\r$/,"")'):0.0
# export DISPLAY=$(hostname -I | awk '{print $1}'):0.0

export LIBGL_ALWAYS_INDIRECT=0

export CARGO_ENV_TOP=$HOME
source $CARGO_ENV_TOP/.cargo/env

alias chrome='/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe'
alias tag='ctags -R --languages=C,C++,Python'

if [ -f $ZDOTDIR/.zshrc.local ]; then
    source $ZDOTDIR/.zshrc.local
fi

