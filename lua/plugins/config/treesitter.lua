local ok, tree = pcall(require,'nvin-treesitter.configs')

if not ok then
  return
end

tree.setup({
        ensure_installed = { "lua" },
        sync_install = true,
        auto_install = true,
      }) 
