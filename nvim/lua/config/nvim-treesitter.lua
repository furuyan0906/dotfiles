---------------------------------------------------------------------------------------------------------------------------
-- nvim-treesitter/nvim-treesitter の設定

require('nvim-treesitter.configs').setup({
    -- Automatically install missing parsers when entering buffer --
    auto_install = true,
    -- List of parsers to ignore installing --
    ignore_install = { },
    highlight = {
        enable = true,
        -- List of language that will be disabled
        disable = { },
    },
})

