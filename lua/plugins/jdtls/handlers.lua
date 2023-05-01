local ok, cmp = pcall(require, "cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()

if not ok then
	return
end

local M = {}
local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
local signature_cfg = {
	bind = true,
	doc_lines = 2,
	floating_window = true,
	hint_enable = false,
	hint_prefix = "➤  ",
	hint_scheme = "String",
	use_lspsaga = false,
	hi_parameter = "Search",
	max_height = 12,
	max_width = 120,
	handler_opts = {
		border = "single",
	},
}

local function set_signature_helper(client, bufnr)
	local shp = client.server_capabilities.signatureHelpProvider
	if shp == true or (type(shp) == "table" and next(shp) ~= nil) then
		require("lsp_signature").on_attach(signature_cfg, bufnr)
	end
end

local function set_hover_border(client)
	local hp = client.server_capabilities.hoverProvider
	if hp == true or (type(hp) == "table" and next(hp) ~= nil) then
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
	end
end

M.on_attach = function(client, bufnr)
	set_signature_helper(client, bufnr)
	set_hover_border(client)
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

M.capabilities = cmp.default_capabilities(capabilities)

return M
