----------------------------------------------------------------------------------------------------------------------------
-- williamboman/mason.nvim の設定

require("mason").setup({
    ui =
    {
        icons =
        {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

