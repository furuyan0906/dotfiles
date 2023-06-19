----------------------------------------------------------------------------------------------------------------------------
-- williamboman/mason-lspconfig.nvim の設定

require('mason-lspconfig').setup({
    setup_handlers = 
    {
        function (server_name)
            local opt =
            {
                ---　補完プラグイン('cmp_nvim_lsp')をLSPと連携させる ---
                capabilities = require('cmp_nvim_lsp').update_capabilities(
                    vim.lsp.protocol.make_client_capabilities()
                ),
            }
            require('lspconfig')[server_name].setup(opt)
        end
    },
})

