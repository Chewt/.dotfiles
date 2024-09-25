-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- LSP stuff
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    'nvim-treesitter/nvim-treesitter',
    'kaarmu/typst.vim',
    'mfussenegger/nvim-jdtls',
    -- Themes
    'morhetz/gruvbox',
    { "rose-pine/neovim", name = "rose-pine" },
    -- AI
    --'David-Kunz/gen.nvim',
    {dir='~/Gits/forks/gen.nvim'},
    -- UI changes
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope.nvim', version = '*'},
    'nvim-telescope/telescope-ui-select.nvim',
    'vim-airline/vim-airline',
    -- Fun stuff
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- This is for git stuff
    'tpope/vim-fugitive'
}

local opts = {}
require('lazy').setup(plugins, opts)
