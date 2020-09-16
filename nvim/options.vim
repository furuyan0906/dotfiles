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
set tags=./GRTAGS;./tags;$HOME
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
set backspace=indent,eol,start
set backspace=2
set spell
set spelllang=en,cjk
set autoindent
set smartindent
set showmatch
set tabstop=4
set shiftwidth=4
set matchtime=2
set ambiwidth=double

" backup
au BufWrite /private/tmp/crontab.* set nowritebackup
au BufWrite /private/etc/pw.* set nowritebackup

