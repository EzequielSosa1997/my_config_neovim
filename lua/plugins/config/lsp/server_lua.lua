 local ok, lsp = pcall(require,'lspconfig')

 if not ok then  return end


local on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_crate_autocmd('BufWritePre',{
        grup = vim.api.nvim_create_augroup('Format',{ clear = true}),
        buffer = bufnr,
        callback = function() vim.lsp.buf.formatting_seq_sync() end
      })
    end
  end



lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
