----------------------------------------------------------------------------------------------------------------------------
-- 基本設定


-- global
vim.g.mapleader = ';'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

if jit.os == 'Windows' then
    vim.g.python3_host_prog = vim.fn.expand("$USERPROFILE") .. [[\.venv\Scripts\python.exe]]
else
    vim.g.python3_host_prog = vim.fs.dirname(vim.fn.system('which python3')) .. '/pynvim-python'
end

-- encoding
vim.opt.encoding      = 'utf-8'
vim.opt.fenc          = 'utf-8'

-- file 
vim.opt.fileformats   = 'unix', 'mac', 'dos'
vim.opt.fileencodings = 'utf-8', 'sjis'
vim.opt.backup        = false
vim.opt.swapfile      = false
vim.opt.hidden        = true

-- visual
vim.opt.ambiwidth     = 'single'
vim.opt.background    = dark
vim.opt.modelines     = 0
vim.opt.number        = true
vim.opt.ruler         = true
vim.opt.title         = true
vim.opt.cursorline    = true
vim.opt.wrap          = true
vim.opt.laststatus    = 2
vim.opt.winblend      = 20
vim.opt.pumblend      = 20
vim.opt.termguicolors = true

-- edit
vim.opt.clipboard:append{'unnamedplus'}
vim.opt.tags        = './tags', 'tags'
vim.opt.mouse       = 'a'
vim.opt.ignorecase  = true
vim.opt.smartcase   = true
vim.opt.incsearch   = true
vim.opt.hlsearch    = true
vim.opt.scrolloff   = 4
vim.opt.backspace   = 'indent', 'eol', 'start', '2'
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

