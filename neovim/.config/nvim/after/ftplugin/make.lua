local rpath = "~/.config/nvim/templates/"
vim.api.nvim_set_keymap("n", ";make", ":-1read "..rpath.."Makefile<CR>", { noremap = false })
