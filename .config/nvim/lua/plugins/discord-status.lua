return {
  {
    "iogamaster/neocord",
    event = "VeryLazy",
    config = function()
      require("neocord").setup({
        -- general options
        logo = "https://i.ibb.co/Pvngdrz0/Frame-3-1.png", -- "auto" or url
        logo_tooltip = "Vimming Away Yuh", -- nil or string
        main_image = "logo", -- "language" or "logo"
        client_id = "1157438221865717891", -- use your own discord application client id (not recommended)
        log_level = nil, -- log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout = 10, -- number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        blacklist = {}, -- a list of strings or lua patterns that disable rich presence if the current file name, path, or workspace matches
        file_assets = {}, -- custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time = true, -- show the timer
        global_timer = false, -- if set true, timer won't update when any event are triggered
        buttons = nil, -- a list of buttons (objects with label and url attributes) or a function returning such list.

        editing_text = "something", -- format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = "browsing something", -- format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = "committing changes", -- format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "managing plugins", -- format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = "reading something", -- format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = "cooking", -- format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = "on a line lol", -- format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
        terminal_text = "wizzard commands", -- format string rendered when in terminal mode.
      })
    end,
  },
}
