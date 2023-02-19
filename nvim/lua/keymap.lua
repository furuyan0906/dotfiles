-- keymaps.lua


-- vim.keymap.set(mode, lhs, rhs, options)
local keymap = vim.keymap

-- <Usage>
-- sj : 分割画面を下に移動
-- sk : 分割画面を上に移動
-- sl : 分割画面を右に移動
-- sh : 分割画面を左に移動
-- ss : 画面を水平分割
-- sv : 画面を垂直分割
-- sq : 画面終了

-- keymaps to move to other window
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sl', '<C-w>l')
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'ss', ':<C-u>sp<CR><C-w>j')
keymap.set('n', 'sv', ':<C-u>vs<CR><C-w>l')
keymap.set('n', 'sq', ':q<Enter><ESC>')

keymap.set('n', '<C-c>', ':tabc<CR><ESC>')

-- keymaps to move to next/previous tab
keymap.set('n', '<C-p>', '<Plug>AirlineSelectPrevTab')
keymap.set('n', '<C-n>', '<Plug>AirlineSelectNextTab')

-- keymaps to sort to next/previous tab
keymap.set('n', '<C-l>', ':+tabmove<CR><ESC>')
keymap.set('n', '<C-h>', ':-tabmove<CR><ESC>')

keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><ESC>')

keymap.set('n', '<silent><Leader><C-]>', '<C-w><C-]><C-w>T')

