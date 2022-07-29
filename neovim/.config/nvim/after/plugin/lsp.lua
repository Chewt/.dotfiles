local lspconfig = require('lspconfig')
lspconfig.ccls.setup{}

--Hover box
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})

--Jump to definition
vim.api.nvim_set_keymap('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})

--Omnifunc
vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

