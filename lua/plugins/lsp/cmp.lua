local ok, cmp = pcall(require, "cmp")
local okLua, luasnip = pcall(require, "luasnip")
local keymap = require("keymaps.lsp.lsp-cmp")
if not okLua then
	return
end
if not ok then
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = keymap(cmp, luasnip),
	sources = {
		{ name = "path" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "nvim_lsp" },
		{ name = "luasnip", keyword_length = 2 },
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "[LSP]",
				luasnip = "[SNIP]",
				buffer = "[BUF]",
				path = "[PATH]",
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})
