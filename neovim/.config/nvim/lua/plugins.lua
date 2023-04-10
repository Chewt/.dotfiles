local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'neovim/nvim-lspconfig'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['nvim-treesitter#TSUpdate']})
Plug 'kaarmu/typst.vim'

vim.call('plug#end')
