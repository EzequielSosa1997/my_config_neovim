local GITGUB_DARK = "github_dark"
local KANAGAWA = "kanagawa"
local ONEDARK = "onedark"
local TOKYONIGHT = "tokyonight"
local VSCODE = "vscode"
local selectTheme = KANAGAWA

local path = "plugins.config.theme." .. selectTheme
require(path)

return selectTheme
