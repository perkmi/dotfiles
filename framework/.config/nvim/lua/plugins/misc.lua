return {
    {
        'mbbill/undotree',

        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
        end
    },
    {
        'brenoprata10/nvim-highlight-colors',

        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    {
        'vimwiki/vimwiki',

        config = function()
            vim.api.nvim_set_hl(0, "VimwikiHeader1", {fg = "#569CD6"})
            vim.api.nvim_set_hl(0, "VimwikiHeader2", {fg = "#9CDCFE"})
            vim.api.nvim_set_hl(0, "VimwikiHeader3", {fg = "#608B4E"})
            vim.api.nvim_set_hl(0, "VimwikiHeader4", {fg = "#DCDCAA"})
            vim.api.nvim_set_hl(0, "VimwikiHeader5", {fg = "#CE9178"})
            vim.api.nvim_set_hl(0, "VimwikiHeader6", {fg = "#F44747"})
        end
    },
    {
        'tpope/vim-commentary',
    }
}
