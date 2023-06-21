----------------------------------------------------------------------------------------------------------------------------
-- nvim-tree/nvim-tree の設定

local api = require('nvim-tree.api')

require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    on_attach = function(bufnr)
        api.config.mappings.default_on_attach(bufnr)
    end,
})

vim.keymap.set('n', 't', api.node.open.tab, { silent = true, noremap = true, nowait = true })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { silent = true, noremap = true, nowait = true })

