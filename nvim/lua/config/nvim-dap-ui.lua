----------------------------------------------------------------------------------------------------------------------------
-- rcarriga/nvim-dap-ui の設定

require('dapui').setup {
  icons = { expanded = '', collapsed = '' },
  layouts = {
    {
      elements = {
        { id = 'repl', size = 0.15 },
        { id = 'stacks', size = 0.2 },
        { id = 'watches', size = 0.2 },
        { id = 'scopes', size = 0.35 },
        { id = 'breakpoints', size = 0.1 }
      },
      size = 0.25,
      position = 'right'
    },
    {
      elements = {
          { id = 'console', size = 1.0 },
      },
      size = 0.2,
      position = 'bottom'
    }
  }
}

