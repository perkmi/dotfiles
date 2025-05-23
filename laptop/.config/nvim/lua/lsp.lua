-- Set up lspconfig.
-- look in https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason-lspconfig").setup {
    ensure_installed = { "bashls", "clangd", "hydra_lsp", "hyprls", "jsonls", "lua_ls", "rust_analyzer", "taplo", "vimls", "yamlls" }
}
require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.hydra_lsp.setup{}
require'lspconfig'.hyprls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.lua_ls.setup{
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
    },
  },
}
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
require'lspconfig'.taplo.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.yamlls.setup{}
vim.filetype.add({
    pattern = {
        ['.*/waybar/config'] = 'jsonc',
        ['.*/hypr/.*%.conf'] = 'hyprlang'
    },
})
