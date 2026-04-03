return {
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            {'neovim/nvim-lspconfig',},
            {'williamboman/mason.nvim',},
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup({
                automatic_installation = false,
            })

            vim.keymap.set("n", "<c-w>d", vim.diagnostic.open_float, { noremap = true })
            vim.diagnostic.config {virtual_text = false}

            -- Set up gdscript suppor (godot script)
            vim.lsp.enable('gdscript')

            -- Set up zig language server
            vim.lsp.config('zls', {
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
            })
            vim.lsp.enable('zls')
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
    },
    {'kaarmu/typst.vim',},
    {'ziglang/zig.vim',},
}
