return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd" },
			cpp = { "clang_format" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
		},
	},
}
