----------------------------------------------------------------------------------------------------------------------------
-- williamboman/mason-lspconfig.nvim の設定

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
    -- masonでインストールした各Language ServerをSetupする
    function (server_name)
        ---　補完プラグイン('cmp_nvim_lsp')をLSPと連携させる ---
        require('lspconfig')[server_name].setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities()
        }
    end,
    -- Language Serverを個別に設定することもできる
    -- rust_analyzer = function()
    -- end,
})

