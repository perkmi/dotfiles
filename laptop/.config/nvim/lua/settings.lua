-- Basic settings
--set mouse=a
--syntax on
--set ignorecase
--set smartcase
--set encoding=utf-8
--set expandtab
--set shiftwidth=2
--set softtabstop=2
--set tabstop=2
--set number relativenumber
--set termguicolors
--colorscheme codedark

-- Autocompletion
--set wildmode=longest,list,full

-- Fix splitting
--set splitbelow splitright

-- Use system clipboard
--set clipboard+=unnamedplus

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
vim.cmd.colorscheme('codedark')

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
