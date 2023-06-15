----------------------------------------------------------------------------------------------------------------------------
-- nvim-telescope/telescope.nvim の設定


local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- デフォルトマッピング
    api.config.mappings.default_on_attach(bufnr)

    -- カスタムマッピング
    --
    -- t     : ファイルを新しいタブで開く
    -- <C-e> : でトグルを切り替える
    vim.keymap.set('n', 't',     api.node.open.tab, opts('Open: New Tab'))
    vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>',   opts('Open or close the tree'))
end


require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    on_attach = my_on_attach,
})

