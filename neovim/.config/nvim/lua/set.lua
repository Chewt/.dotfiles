vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
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

vim.g.maplocalleader = ';'

-- Run a command and place its output in a scratch buffer
vim.cmd('com! -nargs=+ Run split | wincmd j | enew | setlocal buftype=nofile noswapfile bufhidden=wipe nobuflisted | resize 10 | silent -r! <args>')

-- Set makeprg and run make in one go
vim.cmd('com! -nargs=+ Make let &makeprg = "<args>" | make')

-- Set makeprg temporarily, run make, then set it back
vim.cmd('com! -nargs=+ Maket let oldmakeprg = &makeprg | let &makeprg = "<args>" | make | let &makeprg = oldmakeprg')
