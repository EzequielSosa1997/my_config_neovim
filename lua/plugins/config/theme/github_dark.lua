local _github, github = pcall(require, "github-theme")

if not _github then
	return
end

github.setup({

	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	colors = { hint = "orange", error = "#ff0000" },

	-- Overwrite the highlight groups
	overrides = function(c)
		return {
			htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
			DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
			-- this will remove the highlight groups
			TSField = {},
		}
	end,
})

vim.cmd("colorscheme github_dark")
