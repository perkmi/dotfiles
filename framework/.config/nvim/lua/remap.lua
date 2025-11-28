-- Set mapleader to <Space> for easier keybindings
vim.g.mapleader = ' '

-- Save file as sudo (useful when you forget to open Neovim with sudo)
vim.keymap.set("c", "w!!", "w !sudo tee > /dev/null %")

-- General Keymaps
vim.keymap.set('n', '<leader>e', vim.cmd.Ex, { desc = "Open file explorer" })  -- Open Netrw file explorer
vim.keymap.set("n", "<leader>s", [[:%s/\s\+$//e<CR>]], { desc = "Remove trailing whitespace" })  -- Remove trailing whitespace in the entire file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })  -- Make the current file executable

-- Split Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })  -- Move to the left split window
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })  -- Move to the bottom split window
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })  -- Move to the top split window
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })  -- Move to the right split window

-- Improved Vertical Movement for Wrapped Lines
vim.keymap.set("n", "j", "gj", { desc = "Move down (visual lines)" })  -- Move down by visual line (useful for wrapped text)
vim.keymap.set("n", "k", "gk", { desc = "Move up (visual lines)" })  -- Move up by visual line (useful for wrapped text)
