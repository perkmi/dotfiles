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

-- LSP Keymaps
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })  -- Open code actions menu for LSP suggestions

-- Plugin Keymaps
-- Undotree: Toggle undo history visualization
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })

-- nvim-tree: Toggle file explorer
vim.keymap.set("n", "<C-f>", vim.cmd.NvimTreeToggle, { desc = "Toggle file explorer" })

-- Telescope: Fuzzy finder keymaps
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })  -- Find files in the current directory
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })  -- Search for text in the workspace
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })  -- Search in the current buffer
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Recent files" })  -- Search for recently opened files
vim.keymap.set('n', '<leader>fs', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, { desc = "Grep string" }) -- Search for a specific string in files
