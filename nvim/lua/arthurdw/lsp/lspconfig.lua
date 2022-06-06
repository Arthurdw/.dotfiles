local lspconfig = require("lspconfig")

lspconfig.ltex.setup({
	filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" },
})
