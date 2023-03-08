" plugin & indent enable
filetype plugin indent on
syntax on

" colorscheme
colorscheme darktheme
set background=dark
set t_Co=256

" utility
set modelines=0		" CVE-2007-2438
set fenc=utf-8
set nobackup
set noswapfile
set laststatus=2
set encoding=utf-8
set hidden

" grep
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set tags=./tags,tags
set ignorecase
set smartcase
set incsearch
set hlsearch

" I/O
set mouse=a
set scrolloff=4

" view
set number
set ruler
set title
set cursorline
set wrap

" edit
set clipboard+=unnamedplus
set backspace=indent,eol,start
set backspace=2
set spell
set spelllang=en,cjk
set showmatch
set autoindent
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set matchtime=2
set ambiwidth=double

