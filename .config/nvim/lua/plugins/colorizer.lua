return {
  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function(_, _)
      require("colorizer").setup()
    end,
  },
}
