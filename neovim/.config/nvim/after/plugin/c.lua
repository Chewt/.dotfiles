function c_setup()
    local set = vim.opt
    local setl = vim.opt_local
    local keymap = vim.api.nvim_set_keymap
    local re = { noremap = false }
    local nore = { noremap = true }
    local rpath = "~/.config/nvim/templates/c"

    setl.textwidth = 80
    setl.colorcolumn = "81"

    keymap("n", "<Leader>r", ':silent !cat Makefile | grep "INCLUDEDIR = " | sed -e "s/^.*= /clang\\n-I/" > .ccls<CR>:redraw!<CR>:LspRestart<CR>', nore)
    keymap("i", ";;", '<ESC>A;', nore)
    keymap("n", "<Leader>l", '<cmd>lua vim.diagnostic.goto_next()<CR>', nore)
    keymap("n", "<Leader>h", '<cmd>lua vim.diagnostic.goto_prev()<CR>', nore)
end

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"c", "cpp"},
    callback = function()
        vim.schedule(c_setup)
    end,
})
