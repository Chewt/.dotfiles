local lspconfig = require('lspconfig')
lspconfig.ccls.setup{}
lspconfig.pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 88,
                    ignore = {'E203', 'E501'},
                    select = {'C', 'E', 'F', 'W', 'B', 'B950'}
                },
                black = {
                    enabled = true
                }
            }
        }
    }
}

--Hover box
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})

--Jump to definition
vim.api.nvim_set_keymap('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
