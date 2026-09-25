return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        {
            "nvim-tree/nvim-web-devicons",
            enabled = vim.g.have_nerd_font,
        },
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key",
                    },
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = true,
                    }),
                },
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Search files" })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files" })
        vim.keymap.set("n", "<leader>ps", builtin.grep_string, { desc = "Search current word" })
        vim.keymap.set("n", "<leader>pw", builtin.live_grep, { desc = "Search by grep" })
        vim.keymap.set("n", "<leader>vrr", builtin.lsp_references, { desc = "Find references" })
        vim.keymap.set("n", "<leader>vws", builtin.lsp_workspace_symbols, { desc = "Workspace symbol" })
        vim.keymap.set("n", "<leader>q", builtin.diagnostics, { desc = "List diagnostics" })
        vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definition" })
        vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Go to implementantions" })
        vim.keymap.set("n", "<leader>st", builtin.git_status, { desc = "Git status on telescope" })
    end,
}
