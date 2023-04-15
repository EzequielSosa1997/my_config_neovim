local M = require("keymaps.lsp.lsp-mason")
local ok, mason = pcall(require, "mason")
local okManson, mason_lspconfig = pcall(require, "mason-lspconfig")

if not ok then
	return
end
if not okManson then
	return
end

local servers = {
	eslint = require("plugins.lsp.lenguaje.linter"),
	lua_ls = require("plugins.lsp.lenguaje.lua"),
}

mason.setup()

-- MASON-LSPCONFIG.NVIM
mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = M.capabilities,
			on_attach = M.on_attach,
			settings = servers[server_name],
		})
	end,
})
