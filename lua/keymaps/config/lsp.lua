local okWich, with_key = pcall(require, "which-key")

if not okWich then
  return
end

with_key.add({
  { "sl", group = "LSP" },
  { "sla", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "slr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "sld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Goto Definition" },
  { "sli", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Goto Implementation" },
  { "slF", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "Goto References" },
  { "slp", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition" },
  { "slK", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Documentation" },
  { "slk", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Documentation" },
  { "slf", "<cmd>Format<cr>", desc = "Format" },
}, { prefix = "Ls" })
