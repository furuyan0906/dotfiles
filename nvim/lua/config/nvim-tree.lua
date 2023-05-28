----------------------------------------------------------------------------------------------------------------------------
-- nvim-telescope/telescope.nvim の設定

require('nvim-tree').setup({
    sort_by = 'case_sensitive',
})

-- C-eでトグルを切り替える
vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>', {silent = true})

