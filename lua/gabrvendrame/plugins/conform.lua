return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = function()
        local tools = require("gabrvendrame.tables.tools")

        return {
            formatters_by_ft = tools.by_filetype("format"),
            default_format_opts = {
                lsp_format = "fallback",
            },
        }
    end,
}
