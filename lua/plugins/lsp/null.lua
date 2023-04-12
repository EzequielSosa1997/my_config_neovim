local ok, null = pcall(require,'null-ls')

if not ok then return end

local lsp_formatting = function(bufnr)
vim.lsp.buf.format({
  filter = function(client)
    -- Ignore formatting from these LSPs
    local lsp_formatting_denylist = {
      eslint = true,
      lemminx = true,
      lua_ls = true,
    }
    if lsp_formatting_denylist[client.name] then
      return false
    end
    return true
  end,
  bufnr = bufnr,
})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null.setup({
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
	sources = {
		require("null-ls").builtins.formatting.prettier.with({
			extra_filetypes = { "xml" },
		}),
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.djlint,
		require("null-ls").builtins.formatting.isort,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.diagnostics.djlint,
		require("null-ls").builtins.diagnostics.flake8,
		require("null-ls").builtins.diagnostics.pylint,
	},
})
