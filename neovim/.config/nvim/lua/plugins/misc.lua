return {
    -- Fun stuff
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        opts = {
            menu = {
                width = vim.api.nvim_win_get_width(0) - 4,
            },
            settings = {
                save_on_toggle = true,
            },
        },
        keys = function()
            local keys = {
                {
                    "g<C-e>",
                    function()
                        require("harpoon"):list():add()
                    end,
                    desc = "Harpoon File",
                },
                {
                    "<C-e>",
                    function()
                        local harpoon = require("harpoon")
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                    desc = "Harpoon Quick Menu",
                },
                {
                    "<C-h>",
                    function()
                        require("harpoon"):list():select(1)
                    end,
                    desc = "Harpoon to File 1",
                },
                {
                    "<C-t>",
                    function()
                        require("harpoon"):list():select(2)
                    end,
                    desc = "Harpoon to File 2",
                },
                {
                    "<C-n>",
                    function()
                        require("harpoon"):list():select(3)
                    end,
                    desc = "Harpoon to File 3",
                },
                {
                    "<C-s>",
                    function()
                        require("harpoon"):list():select(4)
                    end,
                    desc = "Harpoon to File 4",
                },
            }
            return keys
        end,
    },
    -- This is for git stuff
    {'tpope/vim-fugitive'},
    -- AI Related things
    {
        "David-Kunz/gen.nvim",
        opts = {
            model = "gemma3:12b-it-qat", -- The default model to use.
            quit_map = "q", -- set keymap to close the response window
            accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
            host = "localhost", -- The host running the Ollama service.
            port = "11434", -- The port on which the Ollama service is listening.
            display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
            show_prompt = false, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
            show_model = false, -- Displays which model you are using at the beginning of your chat session.
            no_auto_close = true, -- Never closes the window automatically.
            file = false, -- Write the payload to a temporary file to keep the command short.
            hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
            command = function(options)
                local body = {model = options.model, stream = true}
                return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
            end,
            -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
            -- This can also be a command string.
            -- The executed command must return a JSON object with { response, context }
            -- (context property is optional).
            -- list_models = '<omitted lua function>', -- Retrieves a list of model names
            result_filetype = "markdown", -- Configure filetype of the result buffer
            debug = false -- Prints errors and the command which is run.
        },
    },
}
