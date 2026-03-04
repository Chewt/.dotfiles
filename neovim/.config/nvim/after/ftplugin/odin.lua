-- Set quickfix stuff for odin
-- set errorformat=%f(%l:%c)\ %m
-- set makeprg=odin\ run\ .
vim.opt_local.errorformat = "%f(%l:%c) %m"
vim.opt_local.makeprg = "odin run ."
