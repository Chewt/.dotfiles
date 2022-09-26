function vimtex_setup()
    local set = vim.opt
    local setl = vim.opt_local
    local keymap = vim.api.nvim_set_keymap
    local escr = "<ESC>:-1read "
    local texpath = "~/.config/nvim/templates/tex/"
    local re = { noremap = false }
    local nore = { noremap = true }
    setl.conceallevel = 1
    --vim.bo.filetype = 'tex'
    setl.spell = true
    setl.spelllang = "en_us"
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_general_viewer = 'zathura'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.tex_conceal = 'abdmg'
    keymap("i", ";n", "<ESC>/(<>)<CR>cf)", nore)
    keymap("n", ";art", ":-1read "..texpath.."art_template.tex<CR>i;n", re)
    keymap("n", ";ess", ":-1read "..texpath.."essay.tex<CR>i;n", re)
    keymap("i", ";tab", escr..texpath.."table_template.tex<CR>5==i;n", re)
    keymap("i", ";enum", "<ESC>dd:-1read "..texpath.."enum.tex<CR>6==i;n", re)
    keymap("i", ";fr", "<CR>"..escr..texpath.."frac.tex<CR>kJJBXi;n", re)
    keymap("i", ";mi", "<CR>"..escr..texpath.."inline.tex<CR>kJJ==i;n", re)
    keymap("i", ";mt", escr..texpath.."math.tex<CR>5==i;n", re)
    keymap("i", ";code", escr..texpath.."code.tex<CR>4==i;n", re)
    keymap("i", ";sub", escr..texpath.."sub.tex<CR>2==i;n", re)
    keymap("i", ";sec", escr..texpath.."section.tex<CR>2==i;n", re)
    keymap("i", ";def", escr..texpath.."def.tex<CR>3==i;n", re)
    keymap("i", ";tht", escr..texpath.."thought.tex<CR>3==i;n", re)
    keymap("i", ";img", escr..texpath.."image.tex<CR>2==i;n", re)
    keymap("i", ";itm", escr..texpath.."item.tex<CR>4==i;n", re)
    keymap("i", ";emp", "<CR>"..escr..texpath.."emph.tex<CR>kJJ==I;n", re)
    keymap("i", ";cit", "<CR>"..escr..texpath.."cite.tex<CR>kJJ==I;n", re)
    keymap("n", ";ros", ":-1read "..texpath.."rosulek.tex<CR>", re)
    keymap("i", ";2mat", "<CR>"..escr..texpath.."22mat.tex<CR>kJ4==I;n", re)
    keymap("i", ";3mat", "<CR>"..escr..texpath.."33mat.tex<CR>kJ5==I;n", re)
    keymap("i", ";4mat", "<CR>"..escr..texpath.."44mat.tex<CR>kJ6==I;n", re)
    keymap("i", ";plt", "<CR>"..escr..texpath.."plot.tex<CR>kJ6==I;n", re)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.schedule(vimtex_setup)
    end,
})
