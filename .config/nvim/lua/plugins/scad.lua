return {
  {
    "salkin-mada/openscad.nvim",
    config = function()
      vim.g.openscad_load_snippets = true
      require("openscad")

      -- Keybinding to run OpenSCAD
      vim.keymap.set(
        "n",
        "<leader>o",
        "<cmd>lua require('openscad').exec_openscad()<CR>",
        { noremap = true, silent = true }
      )

      -- Extend LazyVim's conform.nvim configuration
      local conform = require("conform")

      conform.formatters_by_ft.openscad = { "clang-format" }
      conform.formatters["clang-format"] = {
        command = "clang-format",
        prepend_args = {
          "--style",
          "{BasedOnStyle: Google, BreakBeforeBraces: Attach, AllowShortIfStatementsOnASingleLine: false, AllowShortLoopsOnASingleLine: false, IndentWidth: 2, ColumnLimit: 80}",
        },
      }
    end,
    dependencies = {
      "L3MON4D3/LuaSnip",
      "junegunn/fzf.vim",
      "stevearc/conform.nvim",
    },
    ft = { "openscad" },
  },
}
