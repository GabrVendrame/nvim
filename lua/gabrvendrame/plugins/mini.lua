return {
    {
        "nvim-mini/mini.snippets",
        version = false,
        opts = function()
            local gen_loader = require("mini.snippets").gen_loader

            return {
                snippets = {
                    gen_loader.from_lang(),
                },
            }
        end,
    },
    {
        "nvim-mini/mini.move",
        version = false,
        opts = {},
    },
    {
        "nvim-mini/mini.surround",
        version = false,
        opts = {},
    },
    {
        "nvim-mini/mini.indentscope",
        version = false,
        opts = {
            draw = {
                delay = 0,
                animation = function()
                    return 0
                end,
            },
        },
    },
}
