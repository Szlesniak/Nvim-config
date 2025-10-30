return {
  {
    -- Plugin 1: Instalator serwerów
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
      PATH = "prepend",
      ensure_installed = {
        "lua_ls",
        "clangd",
        "tsserver",
        "pyright",
        "vtsls"

      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "lua_ls", "clangd", "tsserver", "pyright"},
    },
  },

  {
       "neovim/nvim-lspconfig",
  },
}
