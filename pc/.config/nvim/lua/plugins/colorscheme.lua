return {
  'tomasiser/vim-code-dark',
  lazy = false,
  priority = 1000,
  config = function()

  -- Codedark customizations
  vim.g.codedark_italics = 1
  vim.g.codedark_transparent = 1
  vim.cmd.colorscheme('codedark')

  end,
}
