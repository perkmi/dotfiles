-- nvim_tree
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
          arrow_closed = "",  -- Arrow for closed folders
          arrow_open = "",    -- Arrow for open folders
        },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
})

-- open by default
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
  vim.cmd("wincmd p") --move cursor to file
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- autoclose
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})
