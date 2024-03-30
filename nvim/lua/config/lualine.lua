----------------------------------------------------------------------------------------------------------------------------
-- nvim-lualine/lualine.nvim の設定

require('lualine').setup({
    sections = {
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 2,
            }
        },
    },
    options = {
        theme = 'auto'
    },
})

