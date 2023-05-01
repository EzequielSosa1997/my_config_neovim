local okWich, with_key = pcall(require, "which-key")
local ok, cmp = pcall(require, "cmp_nvim_lsp")
local addCommand = require("keymaps.config.whitch-key")
local capabilities = vim.lsp.protocol.make_client_capabilities()
local M = {}

if not ok or not okWich then
	return
end

M.capabilities = cmp.default_capabilities(capabilities)

M.on_attach = function(client, bufnr)
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

with_key.register({
	name = "LSP",
	a = { addCommand("lua vim.lsp.buf.code_action()"), "Code Action" },
	r = { addCommand("lua vim.lsp.buf.rename()"), "Rename" },
	d = { addCommand("lua vim.lsp.buf.definition()"), "goto definition" },
	i = { addCommand("lua vim.lsp.buf.implementation()"), "goto implementation" },
	F = { addCommand("lua require('telescope.builtin').lsp_references()"), "goto references" },
	p = { addCommand("lua vim.lsp.buf.type_definition()"), "Type definition" },
	K = { addCommand("lua vim.lsp.buf.signature_help()"), "Signature Documentation" },
	k = { addCommand("lua  vim.lsp.buf.hover()"), "Hover Documentation" },
	f = { addCommand("Format"), "Format" },
	-- ds = { addCommand("lua require('telescope.builtin').lsp_document_symbols()"), "Documents Symbols" },
	-- ws = { addCommand("lua require('telescope.builtin').lsp_dynamic_workspace_symbols()"), "Workspace Symbols" },
	--	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	--	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	--	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
}, { prefix = "sl" })

return M
