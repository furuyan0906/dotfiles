
----------------------------------------------------------------------------------------------------------------------------
-- パッケージマネージャー

local lazypath = vim.fn.stdpath('cache') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    default = {
        lazy = true,
    },
    performance = {
        cache = {
            enable = true,
        },
    },
}

local plugins = require('plugins')
require('lazy').setup(plugins, opts)

