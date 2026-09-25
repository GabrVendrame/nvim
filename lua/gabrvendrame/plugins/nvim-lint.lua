return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
        local lint = require("lint")
        local tools = require("gabrvendrame.tables.tools")

        lint.linters_by_ft = tools.by_filetype("lint")

        -- oxlint's github format repeats "file:line:col: " inside the
        -- message body, which nvim-lint keeps verbatim. Strip it so
        -- virtual text is not mostly file path.
        local oxlint = lint.linters.oxlint
        local parse = oxlint.parser
        oxlint.parser = function(output, bufnr, cwd)
            local diagnostics = parse(output, bufnr, cwd)

            for _, diagnostic in ipairs(diagnostics) do
                diagnostic.message = diagnostic.message:gsub("^.-:%d+:%d+: ", "")
            end

            return diagnostics
        end

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("NvimLint", { clear = true }),
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
