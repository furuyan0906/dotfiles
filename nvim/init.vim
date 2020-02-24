" ----- [Settings (vim)] -----
if &compatible
  set nocompatible    " Be iMproved
endif


" ----- [Settings (indent)] -----
filetype plugin off


" ----- [Settings (dein.vim)] -----

" ----- [[dein.vimの自動インストール]] -----
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
	call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

" set runtimepath+=s:dein_repo_dir
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" ----- [[プラグイン読み込み&キャッシュ作成]] -----
let s:toml_file = fnamemodify(expand('<sfile>'), ':h') .'/dein.toml'

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	call dein#load_toml(s:toml_file)
	call dein#end()
	call dein#save_state()
endif

" ----- [[不足プラグインの自動インストール]] -----
if has('vim_starting') && dein#check_install()
	call dein#install()
endif


" -----[[PATH設定]] ------------------------------
let g:python3_host_prog = '/usr/local/bin//python3'


" ----- [プラグインを有効にする] -----
filetype plugin on

" ----- [Settings (plugins)] -----

" ----- [[NERDTree.vim]] -----
" 隠しファイルを表示する
let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTreeFocusToggle<CR>
" デフォルトでツリーを表示させない
let g:nerdtree_tabs_open_on_console_startup=0
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ----- [[vim-airline.vim]] -------------------------
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='lucius'
let g:airline_powerline_fonts = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" ----- [[colorscheme]] -----
syntax on	" シンタックスをオフに設定
colorscheme darktheme
set background=dark


" ----- [Settings (backup)] -----
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup


" ----- [Settings (utility)] -----
set modelines=0		" CVE-2007-2438
set fenc=utf-8
set nobackup
set noswapfile
set laststatus=2
set encoding=utf-8


" ----- [Settings (file)] -----
set backspace=2		" more powerful backspacing


" ----- [Settings (tag jumps)] -----
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set tags=./GRTAGS;./tags;$HOME


" ----- [Settings (standard I/O)] -----
set mouse=a " マウス操作を有効にする
set scrolloff=4 " スクロールの余裕を確保する


" ----- [Settings (view)] -----
set number	" 行数を表示する
set ruler	" ルーラーを表示する
set title	" タイトルを表示する
set cursorline	" 現在の行をハイライト
hi clear Cursorline	" 行番号のみハイライト
set wrap	" ソースコードの折り返しを有効にする
" autocmd ColorScheme highlight Comment ctermfig=22 guifg=#008800


" ----- [Settings (edit)] -----
set backspace=indent,eol,start	" backspaceを有効に
set spell	" スペルチェックを行う
set spelllang=en,cjk	" スペルチェックから日本語を除外する
set autoindent	" 改行時の行のインデントを保持する
set smartindent	" 改行前の行に合わせてインデントを行う
set showmatch
set tabstop=4
set shiftwidth=4
set matchtime=2


" ----- [Settings (insert)] -----
"autocmd BufNewFile *.c 0r $HOME/.vim/template/introduction.txt
"autocmd BufNewFile *.cpp 0r $HOME/.vim/template/introduction.txt
"autocmd BufNewFile *.h 0r $HOME/.vim/template/introduction.txt


" ----- [Settings (grep)] -----
set ignorecase " 検索文字列が小文字の場合は大文字小文字の区別をなくす
set smartcase " 検索文字列に大文字が含まれる場合には区別する
set incsearch " 検索文字列入力時に順次対象文字列にヒットさせる


let g:global_value = "/tmp/.tmp.txt"


vmap <C-L> :w! /tmp/.tmp.txt<CR>
nmap <C-L> :cal Mylispval()<CR>

function Mylispval()
	execute "r !gcl -f < " .g:global_value
endfunction


