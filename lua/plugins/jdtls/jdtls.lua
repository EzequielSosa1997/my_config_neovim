local _jdtls, jdtls = pcall(require, "jdtls")
local _handlers, handlers = pcall(require, "plugins.jdtls.handlers")

if not _jdtls or not _handlers then
	return
end

local function on_init(client)
	if client.config.settings then
		client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
	end
end

local share_dir = os.getenv("HOME") .. "/.local/share"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = share_dir .. "/eclipse/" .. project_name

local java_cmd = "/usr/bin/java"

local bundles = {
	vim.fn.glob(
		share_dir
			.. "/nvim/debug_extensions/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
	),
}
vim.list_extend(
	bundles,
	vim.split(vim.fn.glob(share_dir .. "/nvim/debug_extensions/vscode-java-test/server/*.jar"), "\n")
)

local on_attach = function(client, bufnr)
	handlers.on_attach(client, bufnr)
	if client.name == "jdtls" then
		jdtls = require("jdtls")
		jdtls.setup_dap({ hotcodereplace = "auto" })
		jdtls.setup.add_commands()

		require("jdtls.dap").setup_dap_main_class_configs({
			config_overrides = {
				vmArgs = "-Dspring.profiles.active=local",
			},
		})
	end
end
local LSP_ROOT_PATH = "/home/ezequiel/.local/share/nvim/lsp_servers"
local path_to_lombok = LSP_ROOT_PATH .. "/jdtls/lombok.jar"

local config = {
	cmd = {
		java_cmd,
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. path_to_lombok,
		"-Xms256m",
		"-Xmx2048m",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		LSP_ROOT_PATH .. "/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		LSP_ROOT_PATH .. "/jdtls/config_linux",
		"-data",
		workspace_dir,
	},
	flags = {
		debounce_text_changes = 150,
		allow_incremental_sync = true,
	},
	root_dir = jdtls.setup.find_root({ ".metadata", "pom.xml", ".git" }),

	on_init = on_init,
	init_options = {
		bundles = bundles,
	},
	capabilities = handlers.capabilities,
	on_attach = on_attach,
	settings = {
		java = {
			signatureHelp = {
				enabled = true,
			},
			saveActions = {
				organizeImports = true,
			},
			completion = {
				maxResults = 20,
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
			},
		},
	},
}

local M = {}

M.start = function()
	jdtls.start_or_attach(config)
end

return M
