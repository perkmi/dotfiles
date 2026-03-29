return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.config', -- ✅ Corrected module name
  opts = {
    ensure_installed = { "c", "hyprlang", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc" },
    auto_install = true,
    highlight = {
      enable = true,
      disable = { "c", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc" },
    },
    indent = { -- ✅ Fixed typo: 'ndent' → 'indent'
      enable = true,
    },
  },
}
