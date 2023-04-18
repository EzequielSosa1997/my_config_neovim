local set = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }
vim.g.mapleader = " "

require("keymaps.config.neotree")
require("keymaps.config.bufferline")
require("keymaps.config.telescope")
require("keymaps.config.toggleterm")
require("keymaps.config.rest-server")

--NAVEGATION
set("", "<Left>", "<none>", default_opts)
set("", "<Right>", "<none>", default_opts)
set("", "<Up>", "<none>", default_opts)
set("", "<Down>", "<none>", default_opts)

set("i", "<C-h>", "<Left>", default_opts)
set("i", "<C-l>", "<Right>", default_opts)
set("i", "<C-k>", "<Up>", default_opts)
set("i", "<C-j>", "<Down>", default_opts)

--WRITE QUIT
set("i", "<C-s>", "<cmd>w<cr>", default_opts)
set("", "<C-x>", "<cmd>wq<cr>", default_opts)
set("", "<A-q>", "<cmd>q<cr>", default_opts)
set("n", "<leader>s", "<cmd>w<cr>", default_opts)
