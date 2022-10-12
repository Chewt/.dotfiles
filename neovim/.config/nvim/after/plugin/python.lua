function python_setup()
    local set = vim.opt
    local setl = vim.opt_local
    local keymap = vim.api.nvim_set_keymap
    local re = { noremap = false }
    local nore = { noremap = true }
    local rpath = "~/.config/nvim/templates/python"

    setl.omnifunc = 'v:lua.vim.lsp.omnifunc'

    keymap("n", "<Leader>l", '<cmd>lua vim.diagnostic.goto_next()<CR>', nore)
    keymap("n", "<Leader>h", '<cmd>lua vim.diagnostic.goto_prev()<CR>', nore)
    keymap("n", "<Leader>f", '<cmd>lua vim.lsp.buf.formatting({ async = true })<CR>', nore)
end

vim.api.nvim_create_autocmd("Filetype", {
    pattern = "python",
    callback = function()
        vim.schedule(python_setup)
    end,
})
