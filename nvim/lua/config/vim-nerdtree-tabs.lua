----------------------------------------------------------------------------------------------------------------------------
-- jistr/vim-nerdtree-tabs の設定

local is_stdin = false

vim.keymap.set('', '<C-e>', '<plug>NERDTreeTabsToggle<CR>')
vim.api.nvim_set_var('nerdtree_tabs_open_on_console_startup', 0)

vim.cmd([[
    function! s:MoveCursorAtStart()
        call feedkeys("\<C-l>")
    endfunction
]])

vim.api.nvim_create_autocmd({'StdinReadPre'}, {
    pattern = '*',
    callback = function()
        is_stdin = true
    end
})

vim.api.nvim_create_autocmd({'VimEnter'}, {
    callback = function()
        local argc = vim.fn.argc()
        if ((argc == 1) and not is_stdin) then
            vim.cmd('NERDTree')
        end
    end
})

