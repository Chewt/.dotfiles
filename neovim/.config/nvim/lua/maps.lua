vim.g.mapleader = ' '
vim.api.nvim_set_keymap("i", "{{", "<ESC>A<CR>{<CR>}<ESC>O", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-l>", ":bn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-h>", ":bp<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-c>", "<ESC>", { noremap = true })
