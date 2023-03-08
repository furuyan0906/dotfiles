" init.vim


" global settings {
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let g:python3_host_prog = system('echo -n $(which python3)')
" }


" ------------------------------------------------------------------------------------------------------------------------

" dein.vim settings {
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }

" dein installation check {
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
    	execute '!git clone https://github.com/Shougo/dein.vim ' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }

" begin settings {
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

    " .toml file
    let s:rc_dir = expand('~/.config/nvim')
    let s:toml = s:rc_dir . '/vim_script/dein.toml'

    " read toml and cache
	call dein#load_toml(s:toml, {'lazy': 0})

    " end settings
	call dein#end()
	call dein#save_state()
endif
" }

" plugin installation check {
if dein#check_install()
	call dein#install()
endif
" }

" plugin uninstallation check {
let s:uninstall_plugins = dein#check_clean()
if len(s:uninstall_plugins) > 0
    call map(s:uninstall_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif
" }


" ------------------------------------------------------------------------------------------------------------------------

" read vim settings {
runtime! ./vim_script/option.vim
runtime! ./vim_script/keymap.vim
runtime! ./vim_script/function.vim
" }

