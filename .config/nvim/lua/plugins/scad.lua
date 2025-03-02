return {
  {
    "salkin-mada/openscad.nvim",
    config = function()
      vim.g.openscad_load_snippets = true
      require("openscad")
    end,
    dependencies = { "L3MON4D3/LuaSnip", "junegunn/fzf.vim" },
  },
}
