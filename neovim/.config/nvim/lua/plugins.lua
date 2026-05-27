-------------------
-- Color Schemes --
-------------------
vim.pack.add({
     'https://github.com/morhetz/gruvbox',
     'https://github.com/filipjanevski/0x96f.nvim',
     'https://github.com/blazkowolf/gruber-darker.nvim' ,
     'https://github.com/folke/tokyonight.nvim',
     'https://github.com/EdenEast/nightfox.nvim',
     { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
     { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
})


---------
-- LSP --
---------
vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
})

require('mason').setup()
require('mason-lspconfig').setup({
    automatic_installation = false,
})

vim.keymap.set('n', '<c-w>d', vim.diagnostic.open_float, { noremap = true })
vim.diagnostic.config { virtual_text = false }

--- LSP servers not installed via Mason

-- Zig support
vim.lsp.config('zls', {
    settings = {
        zls = {
            semantic_tokens = 'partial',
        }
    }
})
vim.lsp.enable('zls')

-----------------
-- Tree Sitter --
-----------------
vim.pack.add({
     { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
})

---------------
-- Utilities --
---------------

-- Git integration
vim.pack.add({
    'https://github.com/tpope/vim-fugitive',
})

-- Telescope
vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim', -- dep for telescope and harpoon later on
    'https://github.com/nvim-telescope/telescope.nvim',
})
require('telescope').setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ['<C-h>'] = 'which_key'
            }
        }
    },
    pickers = {},
    extensions = {},
})
vim.keymap.set('n', '<C-f>', function() require('telescope.builtin').find_files()     end , { noremap = true })
vim.keymap.set('n', '<C-b>', function() require('telescope.builtin').buffers()        end , { noremap = true })
vim.keymap.set('n', '<C-g>', function() require('telescope.builtin').default()        end , { noremap = true })
vim.keymap.set('n', 'gr',    function() require('telescope.builtin').lsp_references() end , { noremap = true })

-- Harpoon
vim.pack.add({
    { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
})
require('harpoon').setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
        save_on_toggle = true,
    },
})
local harpoon = require("harpoon")
vim.keymap.set('n', "g<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { noremap = true })
vim.keymap.set('n', "<C-h>", function() harpoon:list():select(1) end, { noremap = true })
vim.keymap.set('n', "<C-t>", function() harpoon:list():select(2) end, { noremap = true })
vim.keymap.set('n', "<C-n>", function() harpoon:list():select(3) end, { noremap = true })
vim.keymap.set('n', "<C-s>", function() harpoon:list():select(4) end, { noremap = true })

-- Exploring GNU info pages
vim.pack.add({
    'https://github.com/HiPhish/info.vim',
})

-- Lualine
vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
})
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'fugitive' }
})

-- Oil.nvim a file manager to replace netrw that supports editing directories as if they were buffers
vim.pack.add({
    'https://github.com/stevearc/oil.nvim'
})
require('oil').setup({
    view_options = {
        show_hidden = true,
    }
})
