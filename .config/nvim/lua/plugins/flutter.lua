return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({})
      require("telescope").load_extension("flutter")
    end,
    keys = {
      {
        "<leader>fu",
        function()
          require("telescope").extensions.flutter.commands()
        end,
        desc = "Telescope Flutter Commands",
      },
    },
  },
}
