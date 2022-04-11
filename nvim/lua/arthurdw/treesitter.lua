require "nvim-treesitter.configs".setup {
    ensure_installed = "all",
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    }
}
