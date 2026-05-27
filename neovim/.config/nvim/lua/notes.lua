-- Custom functionality for interacting with my Obsidian notes

local notes_location = '~/Documents/main-vault/'

-- Go to today's note, creating it if it doesn't exist and respecting the template file
local function today()
    local journal_dir = notes_location..'1-Area/Journal'
    local template_file = notes_location..'2-Resources/Templates/Daily Journal.md'
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

vim.api.nvim_create_user_command(
    'Notes',
    function(opts)
        local subcmd = opts.fargs[1] or "today"

        -- Subcommands
        if subcmd == "today" then
            today()
        end
    end,
    {
        nargs = '?',
    }
)
