----------------------------------------------------------------------------------------------------------------------------
-- hrsh7th/nvim-cmp の設定

local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    -- snippet = {
    --     expand = function(args)
    --         vim.fn['vsnip#anonymous'](args.body)
    --     end,
    -- },
    window = {
        completion = cmp.config.window.bordered({
            border = 'single'
        }),
        documentation = cmp.config.window.bordered({
            border = 'single'
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_prev_item(),
        ['<S-Tab>'] = cmp.mapping.select_next_item(),
        ['<S-{>'] = cmp.mapping.scroll_docs(-4),
        ['<S-}>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<leader>q'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer', keyword_length = 2 },
        -- { name = 'vsnip' },
    }),
    -- experimental = {
    --     ghost_text = false,
    -- },
})

cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'buffer' },
    })
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
    })
})

vim.api.nvim_set_var('vsnip_filetypes', {})

