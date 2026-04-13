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
vim.o.ignorecase = true
vim.o.smartcase = true

vim.g.maplocalleader = ';'

-- Run a command and place its output in a scratch buffer
vim.cmd('com! -nargs=+ Run split | wincmd j | enew | setlocal buftype=nofile noswapfile bufhidden=wipe nobuflisted | resize 10 | silent -r! <args>')

-- Set makeprg and run make in one go
vim.cmd('com! -nargs=+ Make let &makeprg = "<args>" | make')

-- Set makeprg temporarily, run make, then set it back
vim.cmd('com! -nargs=+ Maket let oldmakeprg = &makeprg | let &makeprg = "<args>" | make | let &makeprg = oldmakeprg')

function Align(range_start, range_end, pattern)
    -- Default to '=' for pattern
    pattern = (pattern ~= "" and pattern) or "="

    -- Find max index of pattern
    local maxIndexFound = 0
    local lines = vim.api.nvim_buf_get_lines(0, range_start - 1, range_end, false)
    for _, line in ipairs(lines) do
        local matchIndex = string.find(line, pattern, 1, true)
        if (matchIndex and matchIndex > maxIndexFound) then
            maxIndexFound = matchIndex
        end
    end
    for i, line in ipairs(lines) do
        local matchIndex = string.find(line, pattern, 1, true)
        if (matchIndex) then
            lines[i] = string.sub(line, 1, matchIndex - 1) .. string.rep(" ", maxIndexFound - matchIndex) .. string.sub(line, matchIndex)
        end
    end
    vim.api.nvim_buf_set_lines(0, range_start - 1, range_end, false, lines)
end

vim.api.nvim_create_user_command(
    'Align',
    function(opts)
        Align(opts.line1, opts.line2, opts.fargs[1] or "")
    end,
    {
        nargs = '?',
        range = true
    }
)
