----------------------------------------------------------------------------------------------------------------------------
-- williamboman/mason-lspconfig.nvim の設定

local capabilities = vim.lsp.protocol.make_client_capabilities()

require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers({
    function (server_name)
        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')

        capabilities = cmp_nvim_lsp.default_capabilities()

        ---　補完プラグイン('cmp_nvim_lsp')をLSPと連携させる ---
        lspconfig[server_name].setup {
            capabilities = capabilities
        }
    end,
})

