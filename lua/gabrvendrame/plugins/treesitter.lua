local langs = {
    "bash",
    "dockerfile",
    "javascript",
    "jsdoc",
    "lua",
    "python",
    "sql",
    "typescript",
    "vimdoc",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install(langs)

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
            pattern = langs,
            callback = function()
                if pcall(vim.treesitter.start) then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
