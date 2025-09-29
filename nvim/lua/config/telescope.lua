----------------------------------------------------------------------------------------------------------------------------
-- nvim-telescope/telescope.nvim の設定

local telescope = require('telescope')
telescope.load_extension('file_browser')
telescope.setup({
    extension = {
        file_browser = {
            -- テーマにはivyを使用する --
            theme = 'ivy',
            -- Neovim標準エクスプローラのNetrwをDisableにしてtelescope-file-browserを代わりに使用する --
            hijack_netrw = true,
            mappings = {
                -- ノーマルモード
                ['n'] = {
                    ['<C-h>'] = telescope.extensions.file_browser.actions.goto_home_dir,
                },
            },
        },
    },
})

