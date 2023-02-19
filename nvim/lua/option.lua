-- nvim/lua/option.lua


local opt = vim.opt

-- file 
opt.encoding = 'utf-8'
opt.fenc = 'utf-8'
opt.fileformats = 'unix', 'mac', 'dos'
opt.fileencodings = 'utf-8', 'sjis'
opt.backup = false
opt.swapfile = false
opt.hidden = true

-- view
opt.background = dark
opt.modelines = 0
opt.number = true
opt.ruler = true
opt.title = true
opt.cursorline = true
opt.wrap = true
opt.laststatus = 2

-- edit
opt.tags = './tags', 'tags'
opt.mouse = 'a'
opt.clipboard:append{'unnamedplus'}
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.scrolloff = 4
opt.backspace = 'indent', 'eol', 'start'
opt.spell = true
opt.spelllang = 'en', 'cjk'
opt.showmatch = true
opt.tabstop = 4
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.matchtime = 2
opt.ambiwidth = 'double'

