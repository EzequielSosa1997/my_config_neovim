local ok, cmp = pcall( require, 'cmp')
local okLua, luasnip = pcall(require,'luasnip')
local keymap = require 'keymaps.lsp.lsp-cmp'
if not okLua then return end
if not ok then return end

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = keymap(cmp,luasnip),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}
