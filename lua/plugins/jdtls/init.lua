local function start_language_server(pattern, callback)
	vim.api.nvim_create_autocmd({ "FileType" }, {
		pattern = pattern,
		callback = callback,
		desc = "Start language server: " .. pattern,
	})
end

-- JAVA
local _jdtls, jdtls = pcall(require, "plugins.jdtls.jdtls")
if _jdtls and type(jdtls) ~= "boolean" then
	start_language_server("java", jdtls.start)
end
