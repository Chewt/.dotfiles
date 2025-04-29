return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            {'nvim-lua/plenary.nvim',},
        },
        opts = {
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-h>"] = "which_key"
                    }
                }
            },
            pickers = {},
            extensions = {},
        },
        keys = {
            {'<C-f>', function() require('telescope.builtin').find_files() end },
            {'<C-g>', function() require('telescope.builtin').live_grep() end },
            {'gr', function() require('telescope.builtin').lsp_references() end },
        }
    },
    {
     'nvim-lualine/lualine.nvim',
     dependencies = { 'nvim-tree/nvim-web-devicons' },
     opts = {
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
         extensions = {}

     }
 },
}
