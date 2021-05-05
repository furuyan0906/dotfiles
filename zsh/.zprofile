export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export LANG="ja_JA.UTF-8"
export LESSCHARSET=utf-8

function llvm (){
    export PATH="/usr/local/opt/llvm/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/llvm/lib"
    export CPPFLAGS="-I/usr/local/opt/llvm/include"
    unset -f llvm
}
llvm

if [ -e $HOME/.cargo/env ]; then
	source $HOME/.cargo/env
fi
