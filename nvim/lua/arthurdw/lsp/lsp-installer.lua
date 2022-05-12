local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(
    function(server)
        local opts = {
            on_attach = require("arthurdw.lsp.handlers").on_attach,
            capabilities = require("arthurdw.lsp.handlers").capabilities
        }

        if server.name == "jsonls" then
            local jsonls_opts = require("arthurdw.lsp.settings.jsonls")
            opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
        end

        if server.name == "sumneko_lua" then
            local sumneko_opts = require("arthurdw.lsp.settings.sumneko_lua")
            opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        end

        server:setup(opts)
    end
)
