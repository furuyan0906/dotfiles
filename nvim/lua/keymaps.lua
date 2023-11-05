----------------------------------------------------------------------------------------------------------------------------
-- キーマップ 設定

-------------------------------------------------------------------------------------------
-- checkhealth 

vim.keymap.set('n', '<leader>h', '<cmd>checkhealth<CR>')

-------------------------------------------------------------------------------------------
-- 画面操作

-- sj : 分割画面を下に移動
-- sk : 分割画面を上に移動
-- sl : 分割画面を右に移動
-- sh : 分割画面を左に移動
-- ss : 画面を水平分割
-- sv : 画面を垂直分割
-- sq : 画面終了
vim.keymap.set('n', '<leader>sj', '<C-w>j')
vim.keymap.set('n', '<leader>sk', '<C-w>k')
vim.keymap.set('n', '<leader>sl', '<C-w>l')
vim.keymap.set('n', '<leader>sh', '<C-w>h')
vim.keymap.set('n', '<leader>ss', ':<C-u>sp<CR><C-w>j')
vim.keymap.set('n', '<leader>sv', ':<C-u>vs<CR><C-w>l')
vim.keymap.set('n', '<leader>sq', ':q<Enter><ESC>')

-- 分割したウィンドウ間を移動する
vim.keymap.set('n', '<silent><Leader><C-]>', '<C-w><C-]><C-w>T')


-------------------------------------------------------------------------------------------
-- キーマップ表示

vim.keymap.set('n', '<C-k>', '<cmd>map<CR>')


-------------------------------------------------------------------------------------------
-- バッファ操作

-- バッファを表示する
vim.keymap.set('n', '<C-b><C-l>', '<cmd>ls<CR>')

-- 前後のバッファに移動
vim.keymap.set('n', '<C-p>', '<cmd>bprev<CR>')
vim.keymap.set('n', '<C-n>', '<cmd>bnext<CR>')


-------------------------------------------------------------------------------------------
-- タブ操作

-- 新規タブを開く
vim.keymap.set('n', '<leader><C-t>', '<cmd>tabnew<CR>')

-- 前後のタブに移動
vim.keymap.set('n', '<leader><C-p>', 'gT')
vim.keymap.set('n', '<leader><C-n>', 'gt')

-- 前後のタブと順番を変える
vim.keymap.set('n', '<leader><C-l>', '<cmd>+tabmove<CR><ESC>')
vim.keymap.set('n', '<leader><C-h>', '<cmd>-tabmove<CR><ESC>')


-------------------------------------------------------------------------------------------
-- 検索

-- grep時のハイライトを消す
vim.keymap.set('n', '<Esc><Esc>', '<cmd>nohlsearch<CR><ESC>')

-------------------------------------------------------------------------------------------
-- ターミナル

vim.keymap.set('n', '<leader>t', '<cmd>te<CR>')
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

