"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/furuyan0906/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
" プラグイン管理(dein)
" コマンド実行する $ git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('/Users/furuyan0906/.cache/dein')
  call dein#begin('/Users/furuyan0906/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/furuyan0906/.cache/dein/repos/github.com/Shougo/dein.vim')

  " powerline関係
  call dein#add('vim-airline/vim-airline')

  " Filer関係
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfilter.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs')

  " 隠しファイルを表示する
  let NERDTreeShowHidden = 1
  nnoremap <silent><C-e> :NERDTreeFocusToggle<CR>
  " デフォルトでツリーを表示させる
  let g:nerdtree_tabs_open_on_console_startup=1
  " 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " tags関係
  call dein#add('zebult/auto-gtags.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
"syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

set modelines=0		" CVE-2007-2438


" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup


" 設定
set fenc=utf-8
set nobackup
set noswapfile
set laststatus=2


" タグジャンプ
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set tags=./tags;

"function! s:execute_ctags() abort
"	let tag_name = '.tags' " 探すtagファイル名
"	let tags_path = findfile(tag_file, '.;') " .tagsのパスを取得
"	if tags_path ==# '' " .tagsが見つからなかった場合
"		return
"	endif
"	let tags_dirpath = fnamemodify(tags_path, ':p:h')
"	execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /div/null &' " エラー出力破棄でバックグラウンド実行
"endfunction

"augroup ctags
"	autocmd!
"	autocmd BufWritePost * silent !ctags -R -f .tags
"augroup END


" 移動系
set mouse=a " マウス操作を有効にする
set scrolloff=4 " スクロールの余裕を確保する

" 表示系
syntax on	" シンタックスをオフに設定
set number	" 行数を表示する
set ruler	" ルーラーを表示する
set title	" タイトルを表示する
set cursorline	" 現在の行をハイライト
hi clear Cursorline	" 行番号のみハイライト
set wrap	" ソースコードの折り返しを有効にする
autocmd ColorScheme highlight Comment ctermfig=22 guifg=#008800
"colorscheme solarized
set background=dark
let g:solarized_termcolor=256
let g:solarized_termtrans=1


" 編集系
set backspace=indent,eol,start	" backspaceを有効に
set spell	" スペルチェックを行う
set spelllang=en,cjk	" スペルチェックから日本語を除外する
set autoindent	" 改行時の行のインデントを保持する
set smartindent	" 改行前の行に合わせてインデントを行う
set showmatch
set tabstop=4
set shiftwidth=4
set matchtime=2
set t_Co=256
" hi Comment ctermfg=2


" 定型文の挿入
"autocmd BufNewFile *.c 0r $HOME/.vim/template/introduction.txt
"autocmd BufNewFile *.cpp 0r $HOME/.vim/template/introduction.txt
"autocmd BufNewFile *.h 0r $HOME/.vim/template/introduction.txt


" 検索系
set ignorecase " 検索文字列が小文字の場合は大文字小文字の区別をなくす
set smartcase " 検索文字列に大文字が含まれる場合には区別する
set incsearch " 検索文字列入力時に順次対象文字列にヒットさせる
set fileformat=mac
set fileencodings=utf-8,sjis


let g:global_value = "/tmp/.tmp.txt"


vmap <C-L> :w! /tmp/.tmp.txt<CR>
nmap <C-L> :cal Mylispval()<CR>

function Mylispval()
	execute "r !gcl -f < " .g:global_value
endfunction


