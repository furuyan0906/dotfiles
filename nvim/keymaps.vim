" sj : 分割画面を下に移動
" sk : 分割画面を上に移動
" sl : 分割画面を右に移動
" sh : 分割画面を左に移動
" ss : 画面を水平分割
" sv : 画面を垂直分割
" sq : 画面終了
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l
nnoremap sq :q<Enter><ESC>

nnoremap <C-f> :tabc<CR><ESC>

nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

nnoremap <C-l> :+tabmove<CR><ESC>
nnoremap <C-h> :-tabmove<CR><ESC>

nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

