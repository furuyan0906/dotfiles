----------------------------------------------------------------------------------------------------------------------------
-- williamboman/mason-lspconfig.nvim の設定

local function my_on_attach(client, bufnr)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers
{
    function (server_name)
        require('lspconfig')[server_name].setup
        {
            on_attach = my_on_attach,
            capabilities = capabilities,
        }
    end
}

