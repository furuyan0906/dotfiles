----------------------------------------------------------------------------------------------------------------------------
-- プラグインごとのキーマップ設定


-------------------------------------------------------------------------------------------
-- Lazy

vim.keymap.set('n', '<leader>l', '<cmd>Lazy<CR>')
vim.keymap.set('n', '<leader>p', '<cmd>Lazy profile<CR>')

-------------------------------------------------------------------------------------------
-- telescope

local telescope_builtin = require('telescope.builtin')

-- Ctrl-Cで終了する
vim.keymap.set('n', '<C-f>', '<cmd>Telescope file_browser<cr>', { noremap = true })
vim.keymap.set('n', '<leader>f', telescope_builtin.find_files, {})
vim.keymap.set('n', '<C-g>', telescope_builtin.live_grep, {})


-------------------------------------------------------------------------------------------
-- nvim-tree 

local api = require('nvim-tree.api')

-- vim.keymap.set('n', 't', api.node.open.tab, { silent = true, noremap = true, nowait = true })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { silent = true, noremap = true, nowait = true })


-------------------------------------------------------------------------------------------
-- nvim-dap

local dap = require('dap')

vim.keymap.set('n', '<F5>', dap.continue, { silent = true })
vim.keymap.set('n', '<F10>', dap.step_over, { silent = true })
vim.keymap.set('n', '<F11>', dap.step_into, { silent = true })
vim.keymap.set('n', '<F12>', dap.step_out, { silent = true })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { silent = true })
vim.keymap.set('n', '<leader>bc', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { silent = true })
vim.keymap.set('n', '<leader>bl', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input(Log point message: "))<CR>', { silent = true })

-- nvim-dap-ui

local dapui = require("dapui")

vim.keymap.set('n', '<leader>d', dapui.toggle, {})
vim.keymap.set('n', '<leader>de', dapui.eval, {})

-------------------------------------------------------------------------------------------
-- nvim-lspconfig


-------------------------------------------------------------------------------------------
-- Mason

vim.keymap.set('n', '<leader>m', '<cmd>Mason<CR>')

