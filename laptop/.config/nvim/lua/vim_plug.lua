-- Plugin Manager
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- General Plugins
Plug 'ThePrimeagen/vim-be-good'
Plug 'mbbill/undotree'  -- Undo history visualization
Plug('mg979/vim-visual-multi', { branch = 'master' })  -- Multiple cursors

-- Themes and UI Enhancements
Plug 'vim-airline/vim-airline'  -- Status bar
Plug 'vim-airline/vim-airline-themes'  -- Themes for vim-airline
Plug 'tomasiser/vim-code-dark'  -- Color scheme
Plug 'ap/vim-css-color'  -- CSS color preview

-- File Explorer
Plug 'nvim-tree/nvim-web-devicons'  -- Icons for nvim-tree
Plug 'nvim-tree/nvim-tree.lua'  -- File explorer

-- Syntax Highlighting and Language Support
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = function() vim.cmd('TSUpdate') end })  -- Better syntax highlighting
Plug 'rust-lang/rust.vim'  -- Rust support

-- LSP and Autocompletion
Plug 'williamboman/mason.nvim'  -- LSP installer
Plug 'williamboman/mason-lspconfig.nvim'  -- Mason LSP config
Plug 'neovim/nvim-lspconfig'  -- LSP configurations

-- nvim-cmp (Autocompletion)
Plug 'hrsh7th/nvim-cmp'  -- Completion plugin
Plug 'hrsh7th/cmp-nvim-lsp'  -- LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'  -- Buffer source for nvim-cmp
Plug 'hrsh7th/cmp-path'  -- Path source for nvim-cmp
Plug 'hrsh7th/cmp-cmdline'  -- Command-line source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'  -- Snippet source for nvim-cmp
Plug 'hrsh7th/vim-vsnip'  -- Snippet engine

-- Tools
Plug 'vimwiki/vimwiki'  -- Personal wiki
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })  -- Fuzzy finder
Plug 'nvim-lua/plenary.nvim'  -- Dependency for telescope
Plug 'pechorin/any-jump.nvim'  -- Code navigation and jump-to-definition
Plug 'tpope/vim-commentary'  -- Easy Commenting

-- End Plugin Manager
vim.call('plug#end')
