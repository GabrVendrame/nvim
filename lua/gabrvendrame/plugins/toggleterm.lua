return {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
        open_mapping = [[<A-t>]],
        direction = "float",
        shell = vim.o.shell,
        auto_scroll = true,
        float_opts = {
            border = "curved",
        },
    },
}
