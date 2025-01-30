vim.filetype.add(
    {
        pattern = {
            ["./waybar/config"] = "jsonc",
            ["./hypr/.%.conf"] = "hyprlang"
        }
    }
)
-- Ensure Tree-sitter highlighting is always enabled for hyprlang files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "hyprlang", -- Only enable for hyprlang file type
    callback = function(args)
        local buf = args.buf -- Get the buffer number
        -- Enable Tree-sitter highlighting for the buffer
        vim.treesitter.start(buf, "hyprlang") -- Use the hyprlang parser
    end
})
