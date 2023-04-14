local ONEDARK = "onedark"
local TOKYONIGHT = "tokyonight"
local selectTheme = ONEDARK

local path = "plugins.config.theme." .. selectTheme
require(path)

return selectTheme
