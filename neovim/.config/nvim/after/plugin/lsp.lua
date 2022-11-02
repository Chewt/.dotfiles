local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  --Hover box
  vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})

  --Jump to definition
  vim.api.nvim_set_keymap('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
end


local lspconfig = require('lspconfig')
lspconfig.ccls.setup{
    on_attach = on_attach
}
lspconfig.pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    maxLineLength = 88,
                    ignore = {'E203', 'E501'},
                    select = {'C', 'E', 'F', 'W', 'B', 'B950'}
                },
                black = {
                    enabled = true
                }
            }
        }
    },
    on_attach = on_attach
}
