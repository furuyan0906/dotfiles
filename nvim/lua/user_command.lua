----------------------------------------------------------------------------------------------------------------------------
-- ユーザーコマンドの設定

-- ウィンドウを縦に分割してターミナルを開く
vim.api.nvim_create_user_command(
    'Term',
    function()
        vim.cmd('split | terminal <args>')
    end,
    { nargs = 0 }
)

-- ウィンドウを横に分割してターミナルを開く
vim.api.nvim_create_user_command(
    'Termv',
    function()
        vim.cmd('vsplit | terminal <args>')
    end,
    { nargs = 0 }
)

