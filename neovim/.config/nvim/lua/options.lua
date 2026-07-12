-- Enable ui2
require('vim._core.ui2').enable()

vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.so = 5
vim.opt_local.tw = 0
vim.opt.foldenable = false
vim.opt.hlsearch = false
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.path:append('**')
vim.opt.wildmenu = true
vim.opt.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.g.maplocalleader = ';'

-- Disable providers
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_node_provider    = 0
vim.g.loaded_perl_provider    = 0
vim.g.loaded_python3_provider = 0

-- Color Scheme
vim.cmd('colorscheme terafox')

-- Custom Mappings
vim.g.mapleader = ' '
vim.keymap.set('n', '<Leader>e', ':Oil<CR>', { noremap = true })
vim.keymap.set('i', '<c-c>', '<ESC>',        { noremap = true })
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>',  { noremap = true })
vim.keymap.set('v', '<c-C>', '"+y<ESC>',     { noremap = true })
vim.keymap.set('n', '<c-w>w', ':cwin<CR>',   { noremap = true })
