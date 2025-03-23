local okWich, with_key = pcall(require, "which-key")

if not okWich then
  return
end

with_key.add({
  { "<leader>L", group = "LSP" },
  { "<leader>La", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>Lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>Ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Goto Definition" },
  { "<leader>Li", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Goto Implementation" },
  { "<leader>LF", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "Goto References" },
  { "<leader>Lp", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition" },
  { "<leader>LK", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Documentation" },
  { "<leader>Lk", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Documentation" },
  { "<leader>Lf", "<cmd>Format<cr>", desc = "Format" },
}, { prefix = "<leader>" })
