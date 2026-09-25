return {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
        "nvim-mini/mini.snippets",
        "folke/lazydev.nvim",
    },
    opts = {
        keymap = {
            preset = "default",
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<Tab>"] = { "accept", "snippet_forward", "fallback" },
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
        },

        sources = {
            default = {
                "lazydev",
                "lsp",
                "path",
                "snippets",
                "buffer",
            },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },

        snippets = {
            preset = "mini_snippets",
        },

        fuzzy = {
            implementation = "prefer_rust",
        },

        signature = {
            enabled = true,
        },
    },
}
