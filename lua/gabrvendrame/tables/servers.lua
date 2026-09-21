local S = {}

function S.get_servers()
        return {
                ts_ls = {},
                lua_ls = {
                        settings = {
                                Lua = {
                                        runtime = {
                                                version = "LuaJIT",
                                        },
                                        completion = {
                                                callSnippet = "Replace",
                                        },
                                        diagnostics = {
                                                globals = { "vim", "require" },
                                        },
                                },
                        },
                },
                dockerls = {},
                pylsp = {},
                prismals = {
                        editor = {
                                defaultFormatter = "Prisma.prisma",
                        },
                },
        }
end

return S
