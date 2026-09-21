return {
        "neovim/nvim-lspconfig",
        dependencies = {
                "mason-org/mason.nvim",
                "mason-org/mason-lspconfig.nvim",
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                "saghen/blink.cmp",
        },
        config = function()
                local utils = require("gabrvendrame.utils")
                local tables = require("gabrvendrame.tables")
                local mason = require("mason")
                local mason_lspconfig = require("mason-lspconfig")
                local mason_tool_installer = require("mason-tool-installer")
                local capabilites = require("blink.cmp").get_lsp_capabilities()
                local servers = tables.get_servers()
                local linters = tables.get_linters()
                local formatters = tables.get_formatters()
                local debuggers = tables.get_debuggers()

                mason.setup()

                mason_lspconfig.setup({
                        ensure_installed = vim.tbl_keys(servers),
                        automatic_enable = false,
                })

                local tools = {}
                vim.list_extend(tools, linters)
                vim.list_extend(tools, formatters)
                vim.list_extend(tools, debuggers)
                mason_tool_installer.setup({
                        ensure_installed = tools
                })

                for server_name, server in pairs(servers) do
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilites, server.capabilities or {})

                        vim.lsp.config(server_name, server)
                        vim.lsp.enable(server_name)
                end

                utils.setup_diagnostics()
        end,
}
