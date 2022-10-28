function vimtex_setup()
    local set = vim.opt
    local setl = vim.opt_local
    local keymap = vim.api.nvim_set_keymap
    local re = { noremap = false }
    local nore = { noremap = true }
    setl.conceallevel = 1
    setl.spell = true
    setl.spelllang = "en_us"
    setl.textwidth = 80
    setl.colorcolumn = "81"
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_general_viewer = 'zathura'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.tex_conceal = 'abdmg'
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.schedule(vimtex_setup)
    end,
})
