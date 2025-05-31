return {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Allows extra capabilities provided by nvim-cmp
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()

        -- Set up lspconfig.
        -- look in https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local servers = {
            bashls = {},
            clangd = {},
            hydra_lsp = {},
            hyprls = {},
            jsonls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                        runtime = {
                            version = 'LuaJIT'
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                '${3rd}/luv/library',
                                unpack(vim.api.nvim_get_runtime_file('', true)),
                            },
                        },
                        diagnostics = {
                            disable = { 'missing-fields' }
                        },
                        format = {
                            enable = false
                        }
                    }
                }
            },
            rust_analyzer = {
                capabilities = capabilities,
                filetypes = {"rust"},
                settings = {
                    ['rust-analyzer'] = {
                        cargo = {
                            allFeatures = true,
                        },
                    },
                },
            },
            taplo = {},
            vimls = {},
            yamlls = {},
        }

        -- Mason Config
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        local ensure_installed = vim.tbl_keys(servers or {})
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
            ensure_installed = {},
            automatic_enable = true,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            }
        }

        vim.filetype.add({
            pattern = {
                ['.*/waybar/config'] = 'jsonc',
                ['.*/hypr/.*%.conf'] = 'hyprlang'
            },
        })

        -- LSP Keymaps
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })  -- Open code actions menu for LSP suggestions
        vim.keymap.set("n", "<leader>n", function() vim.diagnostic.jump({ count = 1, float = true }) end)
        vim.keymap.set("n", "<leader>N", function() vim.diagnostic.jump({ count = -1, float = true }) end)
    end,
}
