return {
  "williamboman/mason.nvim",
  config = function()
    local servers = {
      "black",
      "prettier",
      "stylua",
      "sonarlint-language-server",
      "bandit",
      "jsonlint",
    }

    local M = require("keymaps.lsp.lsp-mason")
    local ok, mason = pcall(require, "mason")
    local okManson, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not ok then
      return {}
    end
    if not okManson then
      return {}
    end

    mason.setup({
      ensure_installed = servers,
    })

    local servers_lsp = {
      lua_ls = {
        workspace = { checkThirdParty = true },
        telemetry = { enable = true },
        diagnostics = {
          globals = { "vim" },
        },
      },
      bashls = {
        filetypes = { "sh" },
      },
      ts_ls = {
        init_options = {
          hostInfo = "neovim",
          plugins = {
            {
              name = "typescript-eslint-language-service",
              location = "/usr/local/lib/node_modules/typescript-eslint-language-service",
            },
          },
          preferences = {
            importModuleSpecifier = "relative",
            useLabelForTypeImports = true,
          },
        },
        filetypes = { "javascript", "typescript" },
      },
    }

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers_lsp),
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
  end,
}
