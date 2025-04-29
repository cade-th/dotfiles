return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "rust_analyzer" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "simrat39/rust-tools.nvim" },
		config = function()
			local lspconfig = require("lspconfig")
			local rust_tools = require("rust-tools")

			-- clangd setup
			lspconfig.clangd.setup({})

			-- rust-tools setup (uses rust-analyzer under the hood)
			rust_tools.setup({
				server = {
					settings = {
						["rust-analyzer"] = {
							cargo = { allFeatures = true },
							checkOnSave = {
								command = "clippy",
							},
							-- Optional: better auto-import completions
							completion = {
								postfix = {
									enable = true,
								},
							},
						},
					},
				},
			})

			-- Autoformat Rust on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.rs",
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end,
	},
}

