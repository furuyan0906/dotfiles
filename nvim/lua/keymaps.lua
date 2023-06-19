----------------------------------------------------------------------------------------------------------------------------
-- キーマップ 設定

-------------------------------------------------------------------------------------------
-- 画面操作

-- sj : 分割画面を下に移動
-- sk : 分割画面を上に移動
-- sl : 分割画面を右に移動
-- sh : 分割画面を左に移動
-- ss : 画面を水平分割
-- sv : 画面を垂直分割
-- sq : 画面終了
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'ss', ':<C-u>sp<CR><C-w>j')
vim.keymap.set('n', 'sv', ':<C-u>vs<CR><C-w>l')
vim.keymap.set('n', 'sq', ':q<Enter><ESC>')

-- 分割したウィンドウ間を移動する
vim.keymap.set('n', '<silent><Leader><C-]>', '<C-w><C-]><C-w>T')


-------------------------------------------------------------------------------------------
-- タブ操作

-- 前後のタブに移動
vim.keymap.set('n', '<C-p>', 'gT')
vim.keymap.set('n', '<C-n>', 'gt')

-- 前後のタブと順番を変える
vim.keymap.set('n', '<C-l>', '<cmd>+tabmove<CR><ESC>')
vim.keymap.set('n', '<C-h>', '<cmd>-tabmove<CR><ESC>')



-------------------------------------------------------------------------------------------
-- 検索

-- grep時のハイライトを消す
vim.keymap.set('n', '<Esc><Esc>', '<cmd>nohlsearch<CR><ESC>')

-------------------------------------------------------------------------------------------
-- ターミナル

vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

-------------------------------------------------------------------------------------------
-- ビルドイン LSP

-- vim.keymap.set('n', )
