-- Set up lspconfig.
-- look in https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.clangd.setup{
  capabilities = capabilities,
  cmd = {"clangd"},
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}
require'lspconfig'.hydra_lsp.setup{}
require'lspconfig'.hyprls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.lua_ls.setup{
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}
require'lspconfig'.taplo.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.rust_analyzer.setup{
    capabilities = capabilities,
    filetypes = {"rust"},
    settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}
vim.filetype.add({
    pattern = {
        ['.*/waybar/config'] = 'jsonc',
        ['.*/hypr/.*%.conf'] = 'hyprlang'
    },
})
