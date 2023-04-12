local set = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }


set("n",'<TAB>','<cmd>BufferLineCycleNext<cr>',default_opts)
set("n",'<A-TAB>','<cmd>BufferLineCyclePrev<cr>',default_opts)
set("n",'<leader><TAB>','<cmd>bdelete<cr>',default_opts)
