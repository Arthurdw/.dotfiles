return {
  {
    "salkin-mada/openscad.nvim",
    config = function()
      vim.g.openscad_load_snippets = true
      require("openscad")
      vim.keymap.set(
        "n",
        "<leader>o",
        "<cmd>lua require('openscad').exec_openscad()<CR>",
        { noremap = true, silent = true }
      )
    end,
    dependencies = {
      "L3MON4D3/LuaSnip",
      "junegunn/fzf.vim",
    },
    ft = { "openscad" },
  },
}
