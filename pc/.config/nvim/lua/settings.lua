vim.opt.mouse = "a"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = -1 -- If negative, shiftwidth value is used
vim.o.tabstop = 4
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.clipboard = "unnamedplus"

vim.g.rustfmt_autosave = 1

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.cmd [[
:hi link NvimTreeExecFile Title
:hi link NvimTreeImageFile NvimTreeNormal
:hi link NvimTreeSpecialFile NvimTreeNormal
:hi link NvimTreeSymlink NvimTreeSpecialFile
]]

-- vimwiki colors
vim.cmd [[
hi VimwikiHeader1 guifg=#87d7ff
hi VimwikiHeader2 guifg=#327E9F
hi VimwikiHeader3 guifg=#327E9F
hi VimwikiHeader4 guifg=#327E9F
hi VimwikiHeader5 guifg=#327E9F
hi VimwikiHeader6 guifg=#327E9F
]]
