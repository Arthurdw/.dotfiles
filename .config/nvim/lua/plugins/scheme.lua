return {
  {
    "Olical/conjure",
    ft = { "scheme", "clojure", "racket" },
    lazy = true,
    init = function()
      -- Set configuration options here
      -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
      -- This is VERY helpful when reporting an issue with the project
      -- vim.g["conjure#debug"] = true
      vim.g["conjure#client#scheme#stdio#command"] = "chicken-csi -:c"
      vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "\n-#;%d-> "
      -- vim.g["conjure#client#scheme#stdio#command"] = "plt-r5rs"
      -- vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "\n> "

      -- Prevent the popup from showing in the top-right corner
      vim.g["conjure#log#hud#enabled"] = false
    end,
    config = function()
      -- Unbind the 'K' key from Conjure
      vim.keymap.set("n", "K", "<nop>", { desc = "Unbind Conjure default for K" })
    end,
    dependencies = { "PaterJason/cmp-conjure" },
  },
  {
    "PaterJason/cmp-conjure",
    lazy = true,
    config = function()
      local cmp = require("cmp")
      local config = cmp.get_config()
      table.insert(config.sources, { name = "conjure" })
      return cmp.setup(config)
    end,
  },
}
