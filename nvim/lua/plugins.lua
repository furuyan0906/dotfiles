----------------------------------------------------------------------------------------------------------------------------
-- インストールするプラグイン一覧

return {
    --- Color theme ---
    {
        'kamykn/dark-theme.vim',
        event = {
            'VimEnter',
        },
    },
    {
        'EdenEast/nightfox.nvim',
        event = {
            'VimEnter',
        },
    },
    --- Icon ---
    {
        'nvim-tree/nvim-web-devicons',
        event = {
            'VimEnter',
        },
        config = function()
            require('config/nvim-web-devicons')
        end,
    },
    --- LSP ---
    {
        'neovim/nvim-lspconfig',
        event = {
            'BufRead',
        },
        config = function()
            require('config/nvim-lspconfig')
        end
    },
    {
        'williamboman/mason.nvim',
        build = '<cmd>MasonUpdate',
        config = function()
            require('config/mason')
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            require('config/mason-lspconfig')
        end,
    },
    --- Auto completion ---
    {
        'hrsh7th/nvim-cmp',
        event = {
            'InsertEnter',
            'CmdlineEnter',
        },
        dependencies = {
            'onsails/lspkind.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            require('config/nvim-cmp')
        end,
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        event = {
            'InsertEnter',
        },
    },
    {
        'hrsh7th/cmp-buffer',
        event = {
            'InsertEnter',
        },
    },
    {
        'hrsh7th/cmp-path',
        event = {
            'InsertEnter',
        },
    },
    {
        'hrsh7th/cmp-cmdline',
        event = {
            'ModeChanged',
        },
    },
    {
        'onsails/lspkind.nvim',
        event = {
            'InsertEnter',
            'CmdlineEnter',
        },
    },
    --- DAP ---
    {
        "nvim-neotest/nvim-nio"
    },
    {
        'mfussenegger/nvim-dap',
        event = {
            'VimEnter',
        },
        config = function()
            require('config/nvim-dap')
        end,
    },
    {
        'rcarriga/nvim-dap-ui',
        event = {
            'VimEnter',
        },
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio'
        },
        config = function()
            require('config/nvim-dap-ui')
        end,
    },
    --- Code Snippet ---
    {
        'hrsh7th/vim-vsnip',
        event = {
            'InsertEnter',
        },
    },
    {
        'hrsh7th/cmp-vsnip',
        event = {
            'InsertEnter',
        },
    },
    --- Fuzzy Finder ---
    {
        'nvim-lua/plenary.nvim',
    },
    {
        'nvim-treesitter/nvim-treesitter',
        event = {
            'BufRead',
            'TabNew',
        },
        config = function()
            require('config/nvim-treesitter')
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter'
        },
        event = {
            'VimEnter',
        },
        config = function()
            require('config/telescope')
        end,
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        event = {
            'VimEnter',
        },
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
        },
        --event = {
        --    'BufRead',
        --},
    },
    --- Finder ---
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('config/nvim-tree')
        end,
    },
    --- View ---
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        event = {
            "VimEnter",
        },
        config = function()
            require('config/lualine')
        end,
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        event = {
            "VimEnter",
        },
        config = function()
            require('config/bufferline')
        end,
    },
    --- Terminal ---
    {
        'akinsho/toggleterm.nvim',
        event = {
            'VimEnter'
        },
        config = function()
            require('config/toggleterm')
        end,
    },
    --- Preview ---
    {
        'vim-denops/denops.vim',
        event = {
            'BufRead',
        },
        ft = {
            'markdown',
        },
    },
    {
        'kat0h/bufpreview.vim',
        event = {
            'InsertEnter',
        },
        dependencies = {
            'vim-denops/denops.vim'
        },
        build = {
            'deno task prepare'
        },
        ft = {
            'markdown',
        },
    },
}

