return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettier" },
        prisma = { "prisma" },
        sh = { "shfmt" },
      },
      formatters = {
        prisma = {
          command = "prisma",
          args = { "format" },
          stdin = false, -- Prisma no soporta entrada estándar para formatear
        },
      },
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
}
