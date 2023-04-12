local M = {}

M.Lua = {
			workspace = { checkThirdParty = true},
			telemetry = { enable = true },
			diagnostics = {
				globals = { "vim" },
			},
		}

return M
