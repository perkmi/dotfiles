-- Codedark customizations
vim.g.codedark_italics = 1
vim.g.codedark_transparent = 1
vim.g.airline_theme = 'codedark'
vim.cmd.colorscheme('codedark')

-- air-line
vim.g.airline_powerline_fonts = 1
vim.g.airline_skip_empty_sections = 1

-- vimwiki colors
vim.api.nvim_set_hl(0, "VimwikiHeader1", {fg = "#87d7ff"})
vim.api.nvim_set_hl(0, "VimwikiHeader2", {fg = "#327E9F"})
vim.api.nvim_set_hl(0, "VimwikiHeader3", {fg = "#327E9F"})
vim.api.nvim_set_hl(0, "VimwikiHeader4", {fg = "#327E9F"})
vim.api.nvim_set_hl(0, "VimwikiHeader5", {fg = "#327E9F"})
vim.api.nvim_set_hl(0, "VimwikiHeader6", {fg = "#327E9F"})

-- Define highlight groups for NvimTree
vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { link = 'Title' })
vim.api.nvim_set_hl(0, 'NvimTreeImageFile', { link = 'NvimTreeNormal' })
vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { link = 'NvimTreeNormal' })
vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { link = 'NvimTreeSpecialFile' })
