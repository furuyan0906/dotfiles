----------------------------------------------------------------------------------------------------------------------------
-- mfussenegger/nvim-dap の設定

local dap = require('dap')

dap.adapters = {
    codelldb = {
        type = 'server',
        port = '${port}',
        executable = {
            command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',
            args = { '--port', '${port}' },
        },
    },
}

dap.configurations = {
    cpp = {
        {
            name = 'Launch file',
            type = 'codelldb',
            request = 'launch',
            program = function()
                return vim.fn.stdpath('Path to executable: ', vim.fn.getcwd() .. '/bin/a.out', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false
        }
    },
}
