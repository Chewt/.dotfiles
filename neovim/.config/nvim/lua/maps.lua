vim.g.mapleader = " "
vim.api.nvim_set_keymap("i", "{{", "<ESC>A<CR>{<CR>}<ESC>O", { noremap = true })
vim.api.nvim_set_keymap("i", "((", "()<ESC>i", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-l>", ":bn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-h>", ":bp<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-c>", "<ESC>", { noremap = true })

function makefile_setup()
    local keymap = vim.api.nvim_set_keymap
    local rpath = "~/.config/nvim/templates/"
    keymap("i", ";n", "<ESC>/(<>)<CR>cf)", { noremap = true })
    keymap("n", ";make", ":-1read "..rpath.."Makefile<CR>ggi;n", { noremap = false })
end

vim.api.nvim_create_autocmd("Filetype", {
    pattern = "make",
    callback = function()
        vim.schedule(makefile_setup)
    end,
})
