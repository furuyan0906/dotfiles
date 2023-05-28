----------------------------------------------------------------------------------------------------------------------------
-- scrooloose/nerdtree の設定

vim.api.nvim_set_var('NERDTreeShowHidden', 1)
vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = '*',
    callback = function()
        local isTopWindwos = vim.fn.winnr('$') == 1
        local isNERDTreeTabTree = vim.b.NERDTree and vim.b.NERDTree.isTabTree() or false
        if (isTopWindwos and isNERDTreeExist) then
            vim.cmd('q')
        end
    end,
})

