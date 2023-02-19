-- nvim/init.lua


local fn = vim.fn


-- install plugin-manager (jetpack)
local jetpackurl = 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'
local jetpackfile = '~/dotfiles/nvim/lua/plugins/jetpack.vim'

if fn.filereadable(jetpackfile) == 0 then
  fn.system('curl -fsSLo ' .. jetpackfile .. ' --create-dirs ' .. jetpackurl)
end



require('option')
require('autocmd')
require('function')
require('keymap')

