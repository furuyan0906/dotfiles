----------------------------------------------------------------------------------------------------------------------------
-- nvim-telescope/telescope-file-browser.nvim の設定


vim.api.nvim_set_keymap(
   "n",
   "<space>fb",
   "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
   {noremap = true}
)

