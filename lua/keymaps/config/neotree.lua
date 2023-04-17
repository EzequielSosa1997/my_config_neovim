local set = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

set("n", "<leader>e", "<cmd>NeoTreeFloatToggle<cr>", default_opts)
set("n", "<C-l>", "<c-w>l", default_opts)
set("n", "<C-h>", "<c-w>h", default_opts)
