vim.g.mapleader = " "
local set = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
set("n", "<leader>g", "<cmd>G<cr>", default_opts)
