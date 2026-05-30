-- Custom functionality for interacting with my Obsidian notes

local notes_location = '~/Documents/main-vault/'
local journal_dir = notes_location..'1-Area/Journal'
local template_file = notes_location..'2-Resources/Templates/Daily Journal.md'

-- Go to today's note, creating it if it doesn't exist and respecting the template file
local function today()
    local today_filename = os.date('%Y-%m-%d')..'.md'
    local real_path = vim.fs.abspath(journal_dir..'/'..today_filename)
    local result, _, _ = vim.uv.fs_stat(real_path)
    if result ~= nil then
        vim.cmd('e '..real_path)
    else
        vim.uv.fs_copyfile(vim.fs.abspath(template_file), real_path)
        vim.cmd('e '..real_path)
    end
end

-- Convenience function to manipulate date tables
local function add_days(date, days)
    local days_in_seconds = days * 24 * 60 * 60
    local new_date = os.date('*t', os.time(date) + days_in_seconds)
    assert(type(new_date) ~= "string")
    return new_date
end

-- Jump to the next nth day, can be negative to jump backwards
local function next_or_prev_day(n)
    local current_date
    local current_buffer = vim.api.nvim_buf_get_name(0)
    local bname = vim.fs.basename(current_buffer)
    if bname:find('20%d%d%-%d%d%-%d%d%.md') then
        -- Strip extension
        local date_str = bname:sub(1, bname:len() - 3)
        local year, month, day = date_str:match('(%d+)-(%d+)-(%d+)')
        current_date = { year = year, month = month, day = day }
    else
        current_date = os.date('*t')
    end

    local next_date = add_days(current_date, n)
    local max_tries = 1000
    local result = nil
    local real_path
    while result == nil do
        if max_tries <= 0 then
            print('No '.. (n < 0 and "previous" or "next") .. ' note found')
            return
        end
        max_tries = max_tries - 1
        local filename = os.date('%Y-%m-%d', os.time(next_date)) .. '.md'
        real_path = vim.fs.abspath(journal_dir..'/'..filename)
        result, _, _ = vim.uv.fs_stat(real_path)
        current_date = next_date
        next_date = add_days(next_date, n / math.abs(n))
    end
    vim.cmd('e'..real_path)
end

local options = {
    today    = function() today()              end,
    previous = function() next_or_prev_day(-1) end,
    next     = function() next_or_prev_day(1)  end,
}

vim.api.nvim_create_user_command(
    'Notes',
    function(opts)
        local subcmd = opts.fargs[1] or "today"
        subcmd = subcmd:lower()

        -- Subcommands, allows for partial match
        local matches = {}
        for key, fn in pairs(options) do
            if vim.startswith(key:lower(), subcmd) then
                matches[#matches + 1] = fn
            end
        end

        -- Only execute when subcommand is not ambiguous
        if #matches ~= 1 then
            print('Ambiguous subcommand: ' .. subcmd)
            return
        end
        matches[1]()
    end,
    {
        nargs = '?',
        complete = function (_,_,_)
            local subcmds = {}
            for key, _ in pairs(options) do
                subcmds[#subcmds + 1] = key
            end
            return subcmds
        end
    }
)
