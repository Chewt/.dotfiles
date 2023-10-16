local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- This allows for installing LSP on the fly
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'     
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'   
Plug('VonHeikemen/lsp-zero.nvim', {['branch'] = 'v3.x'})
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['nvim-treesitter#TSUpdate']})
Plug 'kaarmu/typst.vim'
Plug 'mfussenegger/nvim-jdtls'

vim.call('plug#end')
