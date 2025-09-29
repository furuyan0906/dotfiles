----------------------------------------------------------------------------------------------------------------------------
-- neovim/nvim-lspconfig の設定

function on_attach(on_attach)
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
        end,
    })
end

vim.diagnostic.config({
    virtual_text = {
        border = 'single',
        current_line = true,
        header = {},
        suffix = {},
        title = 'Diagnostics',
        format = function(diagnostic)
            if diagnostic.code then
                return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
            else
                return string.format("%s (%s)", diagnostic.message, diagnostic.source)
            end
        end,
    },
})


