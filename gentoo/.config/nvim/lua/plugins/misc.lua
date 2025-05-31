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
            vim.api.nvim_set_hl(0, "VimwikiHeader1", {fg = "#87d7ff"})
            vim.api.nvim_set_hl(0, "VimwikiHeader2", {fg = "#327E9F"})
            vim.api.nvim_set_hl(0, "VimwikiHeader3", {fg = "#327E9F"})
            vim.api.nvim_set_hl(0, "VimwikiHeader4", {fg = "#327E9F"})
            vim.api.nvim_set_hl(0, "VimwikiHeader5", {fg = "#327E9F"})
            vim.api.nvim_set_hl(0, "VimwikiHeader6", {fg = "#327E9F"})
        end
    },
    {
        'tpope/vim-commentary',
    }
}
