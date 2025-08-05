return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "hard",
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      overrides = {
        DiagnosticError = { fg = "#fb4934" },
        DiagnosticWarn = { fg = "#fabd2f" },
        DiagnosticInfo = { fg = "#83a598" },
        DiagnosticHint = { fg = "#8ec07c" },

        ["@keyword"] = { fg = "#d3869b", italic = true },
        ["@type"] = { fg = "#b8bb26" },
        ["@function"] = { fg = "#83a598" },
        ["@variable"] = { fg = "#d79921" },
        ["@constant"] = { fg = "#d65d0e" },
        ["@string"] = { fg = "#b16286" },
        ["@comment"] = { fg = "#928374", italic = true },
        ["@number"] = { fg = "#fabd2f" },
        ["@boolean"] = { fg = "#a89984" },
        ["@property"] = { fg = "#689d6a" },
        ["@punctuation"] = { fg = "#ebdbb2" },
        ["@operator"] = { fg = "#d79921" },
        ["@parameter"] = { fg = "#458588" },

        StatusLine = { fg = "#ebdbb2", bg = "#3c3836" },
        StatusLineNC = { fg = "#a89984", bg = "#3c3836" },
        CursorLineNr = { fg = "#fe8019", bold = true },
        LineNr = { fg = "#7c6f64" },
        Visual = { bg = "#504945" },
        Search = { fg = "#282828", bg = "#fabd2f", bold = true },

        Directory = { fg = "#83a598" },
        Title = { fg = "#d3869b", bold = true },
        GruvboxGreen = { fg = "#98971a" },
        GruvboxYellow = { fg = "#d79921" },
        GruvboxBlue = { fg = "#458588" },
        GruvboxPurple = { fg = "#b16286" },
        GruvboxAqua = { fg = "#689d6a" },
        GruvboxOrange = { fg = "#d65d0e" },
      },
    })
    vim.cmd("colorscheme gruvbox")
  end,
}
