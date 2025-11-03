return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	priority = 10000,
	build = ":TSUpdate",

	opts = {
		ensure_installed = {
			"cpp",
			"lua",
			"rust",
			"javascript",
			"zig",
			"tsx",
			"python",
			"typescript",
			"c_sharp",
		},
		auto_install = true,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},

		indent = {
			enable = true,
		},
	},
}
