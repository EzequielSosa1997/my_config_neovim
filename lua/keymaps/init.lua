local set = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }
vim.g.mapleader = " "

require("keymaps.config.ranger")
require("keymaps.config.bufferline")
require("keymaps.config.telescope")
require("keymaps.config.toggleterm")
require("keymaps.config.rest-server")
require("keymaps.config.git-fugitive")
local startWidth = require("keymaps.function.resizeWindows")
require("keymaps.function.splitHorizontal")
require("keymaps.config.undotree")
require("keymaps.config.gitsigns")
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

--NAVEGATION-WINDOWS
set("n", "<C-l>", "<c-w>l", default_opts)
set("n", "<C-h>", "<c-w>h", default_opts)
set("n", "<C-k>", "<c-w>k", default_opts)
set("n", "<C-j>", "<c-w>j", default_opts)

--TERMINAL
vim.api.nvim_set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true })
set(
	"n",
	"<C-t>",
	"<cmd>terminal<cr><cmd>vertical resize"
		.. tostring(startWidth)
		.. "<cr><cmd>set nonumber<cr><cmd>set norelativenumber<cr>",
	default_opts
)
set("n", "<leader>sd", "<cmd>w | source % <cr>", default_opts)
set("n", "<leader>h", ":lua sumWindow()<cr>", default_opts)
set("n", "<leader>l", ":lua restWindow()<cr>", default_opts)
set("n", "<leader>j", ":lua restWindowHorizotal()<cr>", default_opts)
set("n", "<leader>k", ":lua sumWindowHorizotal()<cr>", default_opts)
