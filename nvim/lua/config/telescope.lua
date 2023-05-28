----------------------------------------------------------------------------------------------------------------------------
-- nvim-telescope/telescope.nvim の設定

require('telescope').setup({
    extension =
    {
        file_browser =
        {
            -- テーマにはivyを使用する
            theme = 'ivy',
    
            -- Neovim標準エクスプローラのNetrwをDisableにしてtelescope-file-browserを代わりに使用する
            hijack_netrw = true,

            layout_strategy = 'vertical',
            layout_config =
            {
            },
    
            mappings =
            {
                -- インサートモード
                ['i'] =
                {
                    ['<esc>'] = require('telescope.actions').close,
                    ['<C-u>'] = false,
                },
                -- ノーマルモード
                ['n'] =
                {
                },
            },
        },
    },
    load_extension = 'file_browser',   
})

local telescope_builtin = require('telescope.builtin')

-- Ctrl-Cで終了する
vim.keymap.set('n', '<C-f>', telescope_builtin.find_files, {})
vim.keymap.set('n', '<C-g>', telescope_builtin.live_grep, {})

