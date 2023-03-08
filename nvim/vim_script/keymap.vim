" ------------------------------------------------------------------------------------------------------------------------
" 画面操作

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

" 分割したウィンドウ間を移動する
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T


" ------------------------------------------------------------------------------------------------------------------------
" タブ操作

" 前後のタブに移動
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" 前後のタブと順番を変える
nnoremap <C-l> :+tabmove<CR><ESC>
nnoremap <C-h> :-tabmove<CR><ESC>


" ------------------------------------------------------------------------------------------------------------------------
" 検索

" grep時のハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" FizzyFinder(Telescope)を起動する
nmap <C-f> :Telescope<CR>

