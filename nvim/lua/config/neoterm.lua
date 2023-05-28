----------------------------------------------------------------------------------------------------------------------------
-- kassio/neoterm の設定

vim.api.nvim_set_var('neoterm_autoinsert', 1)
vim.api.nvim_set_var('neoterm_autoscroll', 1)
vim.keymap.set('t', '<ESC>', '<C-\\><C-n><C-w>', {silent = true})
vim.keymap.set('v', '<C-e>', 'V:TREPLSendSelection<cr>\'>j$', {silent = true})

