require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "c", "hyprlang", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc" },
    highlight = {
        enable = true,
        disable = { "c", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc" },
    }
}
