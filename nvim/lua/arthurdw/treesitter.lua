require "nvim-treesitter.configs".setup {
    ensure_installed = "all",
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    },
    highlight = {
        enable = true,
        disable = {}, -- List of language names to disable
        additional_vim_regex_highlighting = true
    },
    indent = {
        enable = true,
        disable = {"yaml"} -- List of language names to disable
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?"
        }
    },
    autopairs = {
        enable = true
    },
    autotag = {
        enable = true
    }
}
