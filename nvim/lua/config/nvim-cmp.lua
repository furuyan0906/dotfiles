----------------------------------------------------------------------------------------------------------------------------
-- hrsh7th/nvim-cmp の設定


require('cmp').setup({
    snippet =
    {
        expand = function(args)
            vim.fn['vsnip#anonymous'](argg.body)
        end,
    },
    sources = 
    {
        { name = 'nvim_lsp' },  -- ソース類を設定
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    mapping = require('cmp').mapping.preset.insert({
        ['<C-p>'] = require('cmp').mapping.select_prev_item(),  -- Ctrl-pで補完欄を一つ上に移動
        ['<C-n>'] = require('cmp').mapping.select_next_item(),  -- Ctrl-nで補完欄を一つ下に移動
        ['<C-l>'] = require('cmp').mapping.complete(),
        ['<C-e>'] = require('cmp').mapping.abort(),
        ['<Enter>'] = require('cmp').mapping.abort({ select = true }),  -- Enterで補完の選択を確定
    }),
    experimental =
    {
        ghost_text = false,
    },
    -- LspKindを設定 ---
    formatting =
    {
        format = require('lspkind').cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    },
})

require('cmp').setup.cmdline('/', {
    mapping = require('cmp').mapping.preset.cmdline(),
    sources =
    {
        { name = 'buffer' },  -- ソース類を設定
    },
})

require('cmp').setup.cmdline(':', {
    mapping = require('cmp').mapping.preset.cmdline(),
    sources =
    {
        { name = 'path' },  -- ソース類を設定
    },
})

