return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
        ensure_installed = { "c", "hyprlang", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc" },
        auto_install = true,
        highlight = {
            enable = true,
            disable = { "c", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc" },
        },
        ndent = {
            enable = true,
        },
    },
}
