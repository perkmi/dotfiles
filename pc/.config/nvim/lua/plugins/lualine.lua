return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  lazy = false,
  priority = 1000,
  config = function()

  require('lualine').setup()

  end,
}
