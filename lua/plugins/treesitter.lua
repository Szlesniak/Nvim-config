return {
  "nvim-treesitter/nvim-treesitter",
  -- Zgodnie z README, musi być załadowany na starcie
  lazy = false,
  -- Zgodnie z README, używamy gałęzi 'main'
  branch = 'main',
  -- Zgodnie z README, automatyzujemy :TSUpdate
  build = ":TSUpdate",

  -- Zamiast 'config', używamy 'opts'
  -- lazy.nvim automatycznie wywoła:
  -- require("nvim-treesitter.configs").setup(opts)
  opts = {
    -- Lista parserów, które mają być zainstalowane.
    ensure_installed = { "cpp", "lua", "rust", "javascript", "zig", "tsx", 'py' },

    -- Automatycznie instaluj parsery, jeśli otworzysz
    -- plik, dla którego parsera jeszcze nie ma
    auto_install = true,

    -- Włącz podświetlanie składni (to jest główny cel)
    highlight = {
      enable = true,
    },

    -- Włącz wcięcia oparte na drzewie składni
    indent = {
      enable = true,
    },
  },
}
