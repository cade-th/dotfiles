return {
	-- Mason.nvim for installing LSP servers, linters, and formatters
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	-- Bridge mason.nvim with nvim-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "pyright", "lua_ls", "rust_analyzer" },
				automatic_installation = true,
			})
		end,
	},
	-- Install linters and formatters
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"cpplint", -- C++ linter
					"ruff", -- Python linter and formatter
					"luacheck", -- Lua linter
					"stylua", -- Lua formatter
					"clang-format", -- C++ formatter
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},
	-- Linting with nvim-lint
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				cpp = { "cpplint" },
				python = { "ruff" },
				lua = { "luacheck" },
				rust = { "clippy" }, -- Rust uses cargo clippy via LSP
			}
			-- Run linters on save
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	-- Formatting with conform.nvim
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					cpp = { "clang-format" },
					python = { "ruff_fix", "ruff_format" },
					lua = { "stylua" },
					rust = { "rustfmt" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true, -- Use LSP if formatter unavailable
				},
			})
		end,
	},
}
