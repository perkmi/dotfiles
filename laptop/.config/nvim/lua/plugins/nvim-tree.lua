return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    config = function()
        -- nvim_tree setup
        require("nvim-tree").setup({
            sort = {
                sorter = "name",
            },
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- Arrow for closed folders
                            arrow_open = "",   -- Arrow for open folders
                        },
                    },
                },
            },
            filters = {
                dotfiles = false,
            },
        })

        -- Open nvim-tree by default
        local function open_nvim_tree()
            require("nvim-tree.api").tree.open()
            vim.cmd("wincmd p") -- Move cursor to file
        end

        vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

        vim.keymap.set("n", "<C-f>", vim.cmd.NvimTreeToggle, { desc = "Toggle file explorer" })

        -- Auto-close nvim-tree if it's the last window
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
            pattern = "NvimTree_*",
            callback = function()
                local layout = vim.api.nvim_call_function("winlayout", {})
                if layout[1] == "leaf" and
                    vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_win_get_buf(layout[2]) }) == "NvimTree" and
                    layout[3] == nil then
                    vim.cmd("confirm quit")
                end
            end
        })
        -- Define highlight groups for NvimTree
        vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { link = 'Title' })
        vim.api.nvim_set_hl(0, 'NvimTreeImageFile', { link = 'NvimTreeNormal' })
        vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { link = 'NvimTreeNormal' })
        vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { link = 'NvimTreeSpecialFile' })
    end,
}
