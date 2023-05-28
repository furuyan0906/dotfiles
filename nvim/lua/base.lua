----------------------------------------------------------------------------------------------------------------------------
-- 基本設定


-- global
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- file 
vim.opt.encoding      = 'utf-8'
vim.opt.fenc          = 'utf-8'
vim.opt.fileformats   = 'unix', 'mac', 'dos'
vim.opt.fileencodings = 'utf-8', 'sjis'
vim.opt.backup        = false
vim.opt.swapfile      = false
vim.opt.hidden        = true

-- view
vim.opt.background = dark
vim.opt.modelines  = 0
vim.opt.number     = true
vim.opt.ruler      = true
vim.opt.title      = true
vim.opt.cursorline = true
vim.opt.wrap       = true
vim.opt.laststatus = 2

-- edit
vim.opt.clipboard:append{'unnamedplus'}
vim.opt.tags        = './tags', 'tags'
vim.opt.mouse       = 'a'
vim.opt.ignorecase  = true
vim.opt.smartcase   = true
vim.opt.incsearch   = true
vim.opt.hlsearch    = true
vim.opt.scrolloff   = 4
vim.opt.backspace   = 'indent', 'eol', 'start'
vim.opt.backspace   = '2'
vim.opt.spell       = true
vim.opt.spelllang   = 'en', 'cjk'
vim.opt.showmatch   = true
vim.opt.tabstop     = 4
vim.opt.autoindent  = true
vim.opt.smartindent = true
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 4
vim.opt.matchtime   = 2
vim.opt.ambiwidth   = 'double'

