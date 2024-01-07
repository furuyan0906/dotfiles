----------------------------------------------------------------------------------------------------------------------------
-- プラグインごとのキーマップ設定


-------------------------------------------------------------------------------------------
-- Lazy

vim.keymap.set('n', '<leader>l', '<cmd>Lazy<CR>')
vim.keymap.set('n', '<leader>p', '<cmd>Lazy profile<CR>')

-------------------------------------------------------------------------------------------
-- telescope

local builtin = require('telescope.builtin')

-- Ctrl-Cで終了する
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope file_browser<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>fo', builtin.vim_options, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gl', builtin.git_commits, {})


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
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { silent = true })
vim.keymap.set('n', '<leader>dbc', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { silent = true })
vim.keymap.set('n', '<leader>dbl', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input(Log point message: "))<CR>', { silent = true })

-- nvim-dap-ui

local dapui = require("dapui")

vim.keymap.set('n', '<leader>d', dapui.toggle, {})
vim.keymap.set('n', '<leader>de', dapui.eval, {})

-------------------------------------------------------------------------------------------
-- nvim-lspconfig


-------------------------------------------------------------------------------------------
-- Mason

vim.keymap.set('n', '<leader>m', '<cmd>Mason<CR>')


-------------------------------------------------------------------------------------------
-- Bufferline

vim.keymap.set('n', '<C-n>', '<cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<C-p>', '<cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<C-l>', '<cmd>BufferLineMoveNext<CR>')
vim.keymap.set('n', '<C-h>', '<cmd>BufferLineMovePrev<CR>')

-------------------------------------------------------------------------------------------
-- Toggleterm

vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<CR>')
vim.keymap.set('t', '<leader>t', '<cmd>ToggleTerm<CR>')

