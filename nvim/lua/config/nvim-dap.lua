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
    c = {
        {
            name = 'C Debug',
            type = 'codelldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        },
    },
    cpp = {
        {
            name = 'C++ Debug',
            type = 'codelldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        },
    },
    rust = {
        {
            name = 'Rust Debug',
            type = 'codelldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        },
    },
}

