--diagnostic

require("setting.diagnostic")

-- Visual
vim.o.conceallevel = 0 -- Don't hide quotes in markdown
vim.o.cmdheight = 1
vim.o.pumheight = 10
vim.o.showmode = false
vim.o.showtabline = 2 -- Always show tabline
vim.o.title = true
vim.o.termguicolors = true -- Use true colors, required for some plugins
-- vim.o.ls                 = 0                         -- Doesn't seem to work
-- vim.o.ch                 = 0                         -- Creates a bug with output messages not appearing correctly
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"
vim.wo.cursorline = true

-- Behavior
vim.o.hlsearch = false
vim.o.ignorecase = true -- Ignore case when using lowercase in search
vim.o.smartcase = true -- But don't ignore it when using upper case
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.expandtab = true -- Convert tabs to spaces.
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 12 -- Minimum offset in lines to screen borders
vim.o.sidescrolloff = 8
vim.o.mouse = "a"

-- Vim specific
vim.o.hidden = true
vim.o.fileencoding = "utf-8"
vim.o.spell = false
vim.o.spelllang = "en_us"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.wildmode = "longest,full"
vim.o.updatetime = 300
vim.g.do_file_type_lua = 1
-- vim.g.node_host_prog = "/usr/lib/node_modules"
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.opt.clipboard = "unnamedplus"

-- GITGUTTER

vim.g.gitgutter_enable = 1
vim.opt.updatetime = 100
vim.opt.clipboard = "unnamedplus"
