local cmp = require("cmp")
local ulti = require("cmp_nvim_ultisnips.mappings")

cmp.setup(
    {
        snippet = {
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)
            end
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "ultisnips"}
            }
        ),
        mapping = {
            ["<Tab>"] = cmp.mapping(
                function(fallback)
                    ulti.expand_or_jump_forwards(fallback)
                end,
                {"i", "s" --[[ "c" (to enable the mapping in command mode) ]]}
            ),
            ["<S-Tab>"] = cmp.mapping(
                function(fallback)
                    ulti.jump_backwards(fallback)
                end,
                {"i", "s" --[[ "c" (to enable the mapping in command mode) ]]}
            ),
            ["<CR>"] = cmp.mapping.confirm({select = true})
        }
    }
)
