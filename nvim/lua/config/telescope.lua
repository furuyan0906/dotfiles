----------------------------------------------------------------------------------------------------------------------------
-- nvim-telescope/telescope.nvim の設定

local fb_actions = require('telescope').extensions.file_browser.actions

require('telescope').setup({
    extension = {
        file_browser = {
            -- テーマにはivyを使用する --
            theme = 'ivy', 
            -- Neovim標準エクスプローラのNetrwをDisableにしてtelescope-file-browserを代わりに使用する --
            hijack_netrw = true,
            mappings = {
                -- ノーマルモード
                ['n'] = {
                    ['<C-h>'] = fb_actions.goto_home_dir,
                },
            },
        },
    },
})
require('telescope').load_extension('file_browser')

