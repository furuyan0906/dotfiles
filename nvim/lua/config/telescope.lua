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

local telescope_builtin = require('telescope.builtin')

-- Ctrl-Cで終了する
vim.keymap.set('n', '<C-f>', '<cmd>Telescope file_browser<cr>', {noremap = true})
vim.keymap.set('n', '<leader>f', telescope_builtin.find_files, {})
vim.keymap.set('n', '<C-g>', telescope_builtin.live_grep, {})

