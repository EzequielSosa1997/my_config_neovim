local GITGUB_DARK = "github_dark"
local ONEDARK = "onedark"
local TOKYONIGHT = "tokyonight"
local VSCODE = "vscode"
local selectTheme = TOKYONIGHT

local path = "plugins.config.theme." .. selectTheme
require(path)

return selectTheme
