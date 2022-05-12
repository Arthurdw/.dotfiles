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
    }
}
