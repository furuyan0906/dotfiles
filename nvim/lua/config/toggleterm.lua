----------------------------------------------------------------------------------------------------------------------------
-- akinsho/toggleterm.nvim の設定

require('toggleterm').setup({
    direction = 'float',
    float_opts = {
        border = 'single',
    },
    vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<CR>')
})

