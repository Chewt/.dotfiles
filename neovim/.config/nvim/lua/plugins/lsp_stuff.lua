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
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline' },
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            modules = {},
        }
    },
    {'kaarmu/typst.vim',},
    {'mfussenegger/nvim-jdtls',},
}
