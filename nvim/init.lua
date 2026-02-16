-- nvim/init.lua

require('base')
require('keymaps')
require('user_command')

if jit.os ~= 'Windows' then
    require('lazy_nvim')
    require('colors')
    require('keymaps_config')
end

