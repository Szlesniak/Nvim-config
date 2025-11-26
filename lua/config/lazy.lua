vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set mouse=a")
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 15
vim.opt.cursorline = true
vim.opt.relativenumber = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	ui = {
		border = true,
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
vim.g.lazyvim_check_order = false
vim.cmd("filetype plugin indent on")

-------------------------------------------------------------------THE LSP CONFIGS --------------------------------------------------------------------
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "L", vim.lsp.buf.definition, {})

vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "require", "os" },
			},
		},
	},
})
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("vtsls")
vim.lsp.enable("pyright")
vim.lsp.enable("omnisharp")
vim.lsp.enable("html")
vim.lsp.enable("cssls")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cpp" },
	callback = function()
		vim.opt_local.makeprg = "g++ % -o /tmp/a.out -Wall"
		vim.opt_local.errorformat = "%f:%l:%c: %trror: %m,%f:%l:%c: %tarning: %m,%f:%l:%c: %m"
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<F9>",
			":w<CR>:make<CR>:!/tmp/a.out<CR>",
			{ noremap = true, silent = false }
		)
		vim.api.nvim_buf_set_keymap(0, "n", "<F10>", ":w<CR>:make<CR>", { noremap = true, silent = false })
	end,
})
