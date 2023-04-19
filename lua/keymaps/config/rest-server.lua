local set = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local comand = ":lua require('rest-nvim').run()<CR>"
vim.g.mapleader = " "

set("n", "<leader>;", comand, default_opts)
