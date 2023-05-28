----------------------------------------------------------------------------------------------------------------------------
-- vim-airline/vim-airline の設定

vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
vim.api.nvim_set_var('airline#extensions#tabline#buffer_idx_mode', 1)
vim.cmd([[
    let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 '
        \}
]])
vim.api.nvim_set_var('airline_theme', 'lucius')
vim.api.nvim_set_var('airline_powerline_fonts', 1)

