----------------------------------------------------------------------------------------------------------------------------
-- williamboman/mason-lspconfig.nvim の設定

require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers {
    function (server_name)
        require('lspconfig')[server_name].setup {
            ---　補完プラグイン('cmp_nvim_lsp')をLSPと連携させる ---
            capabilities = require('cmp_nvim_lsp').default_capabilities()
        }
    end,
}

