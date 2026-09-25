-- Every tool named once. `mason` is the package to install and doubles as the
-- conform formatter / nvim-lint linter name. `role` decides which of the two
-- consumes it, `filetypes` is what it runs on.
local M = {}

M.list = {
    { mason = "stylua", role = "format", filetypes = { "lua" } },
    { mason = "black", role = "format", filetypes = { "python" } },
    { mason = "sqruff", role = "format", filetypes = { "sql" } },
    {
        mason = "oxfmt",
        role = "format",
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json",
            "jsonc",
            "css",
            "markdown",
            "html",
            "vue",
            "yaml",
        },
    },
    { mason = "mypy", role = "lint", filetypes = { "python" } },
    { mason = "sqruff", role = "lint", filetypes = { "sql" } },
    {
        mason = "oxlint",
        role = "lint",
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
    },
}

-- shape conform and nvim-lint both want: { [filetype] = { "tool", ... } }
function M.by_filetype(role)
    local by_ft = {}

    for _, tool in ipairs(M.list) do
        if tool.role == role then
            for _, filetype in ipairs(tool.filetypes) do
                by_ft[filetype] = by_ft[filetype] or {}
                table.insert(by_ft[filetype], tool.mason)
            end
        end
    end

    return by_ft
end

-- mason packages, deduplicated (sqruff both formats and lints)
function M.packages()
    local seen = {}
    local packages = {}

    for _, tool in ipairs(M.list) do
        if not seen[tool.mason] then
            seen[tool.mason] = true
            table.insert(packages, tool.mason)
        end
    end

    return packages
end

return M
