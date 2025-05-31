return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('telescope').setup{
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
        },
      },
    }

    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })  -- Find files in the current directory
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })  -- Search for text in the workspace
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })  -- Search in the current buffer
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Recent files" })  -- Search for recently opened files
    vim.keymap.set('n', '<leader>fs', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, { desc = "Grep string" }) -- Search for a specific string in files
  end,
}
