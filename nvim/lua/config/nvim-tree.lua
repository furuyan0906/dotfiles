----------------------------------------------------------------------------------------------------------------------------
-- nvim-tree/nvim-tree の設定

require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    view = {
        adaptive_size = true,
        float = {
            enable = true,
            quit_on_focus_loss = true,
        },
        width = {
            min = 120,
            max = -1,
            padding = 0,
        },
    },
    renderer = {
        full_name = true,
        icons = {
            glyphs = {
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        }
    },
    filters = {
        git_ignored = true,
        custom = {
            "^\\.git",
        },
    },
    on_attach = function(bufnr)
        require('nvim-tree.api').config.mappings.default_on_attach(bufnr)
    end,
})

