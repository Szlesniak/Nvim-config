return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = { border = "rounded" },
			PATH = "prepend",
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright",
				"vtsls",
				"omnisharp",
				"html",
				"cssls",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = { "lua_ls", "clangd", "pyright", "vtsls", "omnisharp", "html", "cssls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})
			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})
			vim.lsp.config("vtsls", {
				capabilities = capabilities,
			})
			vim.lsp.config("omnisharp", {
				capabilities = capabilities,
			})
		end,
	},
}
