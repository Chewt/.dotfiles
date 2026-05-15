-----------
-- Align --
-----------
function Align(range_start, range_end, pattern)
    -- Default to '=' for pattern
    pattern = (pattern ~= "" and pattern) or "="
    local re = vim.regex(pattern)

    -- Find max index of pattern
    local target_buf = vim.api.nvim_get_current_buf()
    local maxIndexFound = 0
    local lines = vim.api.nvim_buf_get_lines(target_buf, range_start - 1, range_end, false)
    for _, line in ipairs(lines) do
        local matchIndex, _ = re:match_str(line)
        if (matchIndex and matchIndex > maxIndexFound) then
            maxIndexFound = matchIndex
        end
    end
    for i, line in ipairs(lines) do
        local matchIndex, _ = re:match_str(line)
        if (matchIndex) then
            lines[i] = string.sub(line, 1, matchIndex) .. string.rep(" ", maxIndexFound - matchIndex) .. string.sub(line, matchIndex + 1)
        end
    end
    vim.api.nvim_buf_set_lines(target_buf, range_start - 1, range_end, false, lines)

    -- Set visual marks back due to nvim_buf_set_lines clobbering them
    vim.api.nvim_buf_set_mark(target_buf, "<", range_start, 0, {})
    vim.api.nvim_buf_set_mark(target_buf, ">", range_end  , 0, {})
end

local function preview_align_regex(opts, ns_id, _)
    local pattern = (opts.args ~= "" and opts.args) or "="
    local re = vim.regex(pattern)
    if not re then return 0 end

    local target_buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(target_buf, opts.line1 - 1, opts.line2, false)
    for i, line in ipairs(lines) do
        local start, finish = re:match_str(line)
        vim.hl.range(
            target_buf,
            ns_id,
            "IncSearch",
            { opts.line1 - 1 + i - 1, start  },
            { opts.line1 - 1 + i - 1, finish }
        )
    end
    return 1
end

vim.api.nvim_create_user_command(
    'Align',
    function(opts)
        Align(opts.line1, opts.line2, opts.fargs[1] or "")
    end,
    {
        nargs   = '?',
        range   = true,
        preview = preview_align_regex
    }
)

---------
-- Run --
---------

-- Run a command and place its output in a scratch buffer
vim.cmd('com! -nargs=+ Run split | wincmd j | enew | setlocal buftype=nofile noswapfile bufhidden=wipe nobuflisted | resize 10 | silent -r! <args>')

----------
-- Make --
----------

-- Set makeprg and run make in one go
vim.cmd('com! -nargs=+ Make let &makeprg = "<args>" | make')

-----------
-- Maket --
-----------

-- Set makeprg temporarily, run make, then set it back
vim.cmd('com! -nargs=+ Maket let oldmakeprg = &makeprg | let &makeprg = "<args>" | make | let &makeprg = oldmakeprg')

-------------
-- Scratch --
-------------

-- Make a new scratch buffer in a new tab
vim.cmd('com! -nargs=0 Scratch tabnew | set buftype=nofile')

-------------
-- DiffOrig --
-------------

-- Show diff between current file state and saved file state
vim.cmd('command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis')
