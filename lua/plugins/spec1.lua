return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 100000,
		opts = {
			transparent_background = false,
			integrations = {
				cmp = true,
				gitsigns = true,
				mason = true,
				treesitter = true,
				rainbow_delimiters = true,
			},
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-mocha",
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
}
