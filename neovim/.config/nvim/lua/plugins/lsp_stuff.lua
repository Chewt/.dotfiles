return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            {'williamboman/mason.nvim',},
            {'williamboman/mason-lspconfig.nvim',},
            {'neovim/nvim-lspconfig',},
            {'hrsh7th/nvim-cmp',},
            {'hrsh7th/cmp-buffer',},
            {'hrsh7th/cmp-path',},
            {'saadparwaiz1/cmp_luasnip',},
            {'hrsh7th/cmp-nvim-lsp',},
            {'hrsh7th/cmp-nvim-lua',},
            {'L3MON4D3/LuaSnip',},
        },
        config = function()
            local lsp = require('lsp-zero')
            lsp.preset("recommended")
            lsp.on_attach(
                function(client, bufnr)
                    lsp.default_keymaps({ buffer = bufnr })
                end)
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
            lsp.setup()
            require('mason').setup({})
            require('mason-lspconfig').setup({
                automatic_installation = false,
                ensure_installed = {},
                handlers = {
                    lsp.default_setup,
                },
            })
            vim.diagnostic.config { virtual_text = true }

            -- Set up gdscript suppor (godot script)
            require('lspconfig').gdscript.setup {}

            -- Set up zig language server
            require('lspconfig').zls.setup {
                -- Server-specific settings. See `:help lspconfig-setup`

                -- omit the following line if `zls` is in your PATH
                -- cmd = { '/path/to/zls_executable' },
                -- There are two ways to set config options:
                --   - edit your `zls.json` that applies to any editor that uses ZLS
                --   - set in-editor config options with the `settings` field below.
                --
                -- Further information on how to configure ZLS:
                -- https://zigtools.org/zls/configure/
                settings = {
                    zls = {
                        -- Whether to enable build-on-save diagnostics
                        --
                        -- Further information about build-on save:
                        -- https://zigtools.org/zls/guides/build-on-save/
                        -- enable_build_on_save = true,

                        -- Neovim already provides basic syntax highlighting
                        semantic_tokens = "partial",

                        -- omit the following line if `zig` is in your PATH
                        -- zig_exe_path = '/path/to/zig_executable'
                    }
                }
            }

            local cmp = require('cmp')
            cmp.setup({
                mapping = {
                    -- Navigate between snippet placeholder
                    ['<C-f>'] = lsp.cmp_action().luasnip_jump_forward(),
                    ['<C-b>'] = lsp.cmp_action().luasnip_jump_backward(),
                }
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {'kaarmu/typst.vim',},
    {'ziglang/zig.vim',},
}
