----------------------------------------------------------------------------------------------------------------------------
-- neovim/nvim-lspconfig の設定

local lspconfig = require('lspconfig')

function on_attach(on_attach)
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local buffer = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
        end,
    })
end

-- 各Language ServerのSetupはmason-lspconfigで行う

