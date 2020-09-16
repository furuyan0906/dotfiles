" No compatible with Vi
if &compatible
  set nocompatible    " Be iMproved
endif

" plugin disable for install
filetype plugin indent off

" auto install of dein.vim
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
	call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

" set runtimepath+=s:dein_repo_dir
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" read plugins & cache
let s:toml_file = fnamemodify(expand('<sfile>'), ':h') .'/dein.toml'

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	call dein#load_toml(s:toml_file)
	call dein#end()
	call dein#save_state()
endif

" install additional plugins
if has('vim_starting') && dein#check_install()
	call dein#install()
endif


" set PATH of Python3
let g:python3_host_prog = expand('/usr/local/bin/python3')
"let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
"let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'


" plugin enable
filetype plugin indent on
syntax on

" read config files
runtime! ./options.vim
runtime! ./keymaps.vim
runtime! ./functions.vim

if has('vim_starting')
	call NeovimUserStart()
endif

