local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- More plugins:
-- Diagnostics: https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- Formatting: https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		diagnostics.flake8,
		diagnostics.eslint,
		code_actions.eslint,
		formatting.eslint,
		diagnostics.codespell,
		formatting.codespell,
		diagnostics.fish,
		formatting.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
	},
})
