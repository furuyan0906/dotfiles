----------------------------------------------------------------------------------------------------------------------------
-- インストールするプラグイン一覧

return {
    --- Color theme ---
    {
        'kamykn/dark-theme.vim',
    },
    {
        'EdenEast/nightfox.nvim',
    },
    --- Icon ---
    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('config.nvim-web-devicons')
        end
    },
    --- LS ---
    {
        'neovim/nvim-lspconfig',
        event =
        {
            'BufRead'
        },
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('config/mason-lspconfig')
        end,
    },
    {
        'williamboman/mason.nvim',
        dependencies =
        {
            'williamboman/mason-lspconfig.nvim'
        },
        config = function()
            require('config/mason')
        end,
    },
    --- Auto completion ---
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter, CmdlineEnter',
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-buffer',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-path',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-cmdline',
        event = 'ModeChanged',
    },
    --- Code Snippet ---
    {
        'hrsh7th/vim-vsnip',
        event = 'InsertEnter',
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
        dependencies =
        {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter'
        },
        config = function()
            require('config/telescope')
        end,
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies =
        {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('config/telescope-file-browser')
        end,
    },
    --- Finder ---
    {
        'nvim-tree/nvim-tree.lua',
        dependencies =
        {
            -- Nerd Fontsのインストールが必要
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('config/nvim-tree')
        end,
    },
    -- {
    --     'scrooloose/nerdtree',
    --     config = function()
    --         require('config/nerdtree')
    --     end
    -- },
    -- {
    --     'jistr/vim-nerdtree-tabs',
    --     config = function()
    --         require('config/vim-nerdtree-tabs')
    --     end
    -- },
    --- Airline ---
    {
        'vim-airline/vim-airline',
        config = function()
            require('config/vim-airline')
        end
    },
    {
        'vim-airline/vim-airline-themes',
    },
    {
        'majutsushi/tagbar',
    },
    --- Window resizer ---
    {
        'simeji/winresizer',
    },
    --- Terminal ---
    -- {
    --     'kassio/neoterm',
    --     config = function()
    --         require('config/neoterm')
    --     end
    -- },
    --- Preview ---
    {
        'vim-denops/denops.vim',
    },
    {
        'kat0h/bufpreview.vim',
        dependencies =
        {
            'vim-denops/denops.vim'
        },
        build =
        {
            'deno task prepare'
        }
    },
}

