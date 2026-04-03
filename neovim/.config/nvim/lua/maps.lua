vim.g.mapleader = " "
vim.api.nvim_set_keymap("i", "{{", "<ESC>A<CR>{<CR>}<ESC>O", { noremap = true })
vim.api.nvim_set_keymap("i", "((", "()<ESC>i", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-c>", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("v", "<c-C>", "\"+y<ESC>", { noremap = true })
