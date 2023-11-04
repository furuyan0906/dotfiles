----------------------------------------------------------------------------------------------------------------------------
-- インストールするプラグイン一覧

return {
    --- Color theme ---
    {
        'kamykn/dark-theme.vim',
        lazy = true,
    },
    {
        'EdenEast/nightfox.nvim',
        lazy = true,
    },
    --- Icon ---
    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('config/nvim-web-devicons')
        end
    },
    {
        'onsails/lspkind.nvim'
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
            'neovim/nvim-lspconfig'
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
    --- DAP ---
    {
        'mfussenegger/nvim-dap',
        config = function()
            require('config/nvim-dap')
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        config = function()
            require('config/nvim-dap-ui')
        end
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
        config = function()
            require('config/nvim-treesitter')
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter'
        },
        event = {
            'BufRead',
            'TabNew',
        },
        config = function()
            require('config/telescope')
        end,
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
        },
        event = {
            'BufRead',
        },
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
    --- Airline ---
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('config/lualine')
        end,
    },
    --- Preview ---
    {
        'vim-denops/denops.vim',
        event = {
            'BufRead',
        },
    },
    {
        'kat0h/bufpreview.vim',
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

