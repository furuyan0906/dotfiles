----------------------------------------------------------------------------------------------------------------------------
-- プラグインごとのキーマップ設定

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

vim.keymap.set('n', 't', api.node.open.tab, { silent = true, noremap = true, nowait = true })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { silent = true, noremap = true, nowait = true })


-------------------------------------------------------------------------------------------
-- nvim-dap

vim.keymap.set('n', '<F5>', '<cmd>lua require("dap").continue()<CR>', { silent = true })
vim.keymap.set('n', '<F10>', '<cmd>lua require("dap").step_over()<CR>', { silent = true })
vim.keymap.set('n', '<F11>', '<cmd>lua require("dap").step_into()<CR>', { silent = true })
vim.keymap.set('n', '<F12>', '<cmd>lua require("dap").step_out()<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', '<cmd>lua require("dap").toggle_breakpoint()<CR>', { silent = true })
vim.keymap.set('n', '<leader>bc', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { silent = true })
vim.keymap.set('n', '<leader>bl', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input(Log point message: "))<CR>', { silent = true })


-------------------------------------------------------------------------------------------
-- nvim-lspconfig


-------------------------------------------------------------------------------------------
-- Mason

vim.keymap.set('n', '<leader>m', '<cmd>Mason<CR>')

