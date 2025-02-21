local ok, cmp = pcall(require, "cmp")
local okLua, luasnip = pcall(require, "luasnip")
local okSni, snippy = pcall(require, "snippy")
local keymap = require("keymaps.lsp.lsp-cmp")
if not okLua then
	return
end
if not ok then
	return
end

if not okSni then
	return
end

local kind_icons = {
	Class = "ﴯ",
	Color = "",
	Constant = "",
	Constructor = "",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "",
	File = "",
	Folder = "",
	Function = "",
	Interface = "",
	Keyword = "",
	Method = "",
	Module = "",
	Operator = "",
	Property = "ﰠ",
	Reference = "",
	Snippet = "",
	Struct = "",
	Text = "",
	TypeParameter = "",
	Unit = "",
	Value = "",
	Variable = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				spell = "[Spellings]",
				zsh = "[Zsh]",
				buffer = "[Buffer]",
				ultisnips = "[Snip]",
				treesitter = "[Treesitter]",
				calc = "[Calculator]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				nvim_lsp_signature_help = "[Signature]",
				cmdline = "[Vim Command]",
			})[entry.source.name]
			return vim_item
		end,
	},
	mapping = keymap(cmp, luasnip),
	completion = {
		keyword_length = 1,
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- For ultisnips users
		-- { name = "ultisnips" },
		-- For vsnip users, uncomment the following.
		-- { name = "vsnip" },
		-- For luasnip users, uncomment the following.
		-- { name = "luasnip" },
		-- For snippy users, uncomment the following.
		-- { name = "snippy" },
	}, {
		{ name = "buffer" },
	}, {
		{ name = "nvim_lsp_signature_help" },
	}, {
		{ name = "path" },
	}),
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}),
})

cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

vim.cmd([[
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
]])
