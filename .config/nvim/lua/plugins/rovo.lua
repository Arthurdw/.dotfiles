return {
  {
    dir = "/home/arthur/Documents/a-line/projects/rovo",
    name = "rovo-lsp-local",
    ft = "rust",
    config = function()
      require("rovo").setup()
    end,
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = { silent = true },
      },
      routes = {
        {
          filter = {
            any = {
              { find = "prepareRename" },
              { find = "No references found" },
            },
          },
          opts = { skip = true },
        },
      },
    },
  },
}
