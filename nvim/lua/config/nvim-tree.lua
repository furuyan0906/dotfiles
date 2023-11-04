----------------------------------------------------------------------------------------------------------------------------
-- nvim-tree/nvim-tree の設定

require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    on_attach = function(bufnr)
        require('nvim-tree.api').config.mappings.default_on_attach(bufnr)
    end,
})

