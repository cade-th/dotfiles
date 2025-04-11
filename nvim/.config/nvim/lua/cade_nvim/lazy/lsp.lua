return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		-- C++ (clangd)
		lspconfig.clangd.setup({
			cmd = { "clangd", "--background-index" },
			filetypes = { "c", "cpp", "objc", "objcpp" },
		})

		-- Python (pyright)
		lspconfig.pyright.setup({
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
					},
				},
			},
		})

		-- Lua (lua_ls)
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }, -- Recognize vim global
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			},
		})

		-- Rust (rust_analyzer)
		lspconfig.rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy", -- Run clippy for linting
					},
					cargo = {
						allFeatures = true,
					},
					diagnostics = {
						enable = true,
					},
				},
			},
		})

		-- Keymaps for LSP
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover info" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
	end,
}
