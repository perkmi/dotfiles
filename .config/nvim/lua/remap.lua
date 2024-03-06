-- mapleader
vim.g.mapleader = ' '

-- Save as sudo
vim.keymap.set("c", "w!!", "w !sudo tee > /dev/null %")

-- Keymaps
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
vim.keymap.set("n", "<leader>wh", [[:%s/\s\+$//e<CR>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Shortcutting split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
