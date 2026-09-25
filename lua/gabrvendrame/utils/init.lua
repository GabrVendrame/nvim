local U = {}

function U.client_supports_method(client, method, bufnr)
    if vim.fn.has("nvim-0.11") == 1 then
        return client:supports_method(method, bufnr)
    else
        return client.supports_method(method, { bufnr = bufnr })
    end
end

function U.set_keymaps(bufnr)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", buffer = bufnr })
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Show diagnostics", buffer = bufnr })
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
    end, { desc = "Next diagnostic", buffer = bufnr })
    vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
    end, { desc = "Previous diagnostic", buffer = bufnr })
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, { desc = "Code action", buffer = bufnr })
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr })
    -- INFO: signature help is <C-s> by default on 0.11+. Mapping it to
    -- <C-h> here would shadow mini.snippets' backward tabstop jump.
end

function U.setup_inlay_hints(client, bufnr)
    local method = vim.lsp.protocol.Methods.textDocument_inlayHint

    local is_supported = client and U.client_supports_method(client, method, bufnr)
    if not is_supported then
        return
    end

    vim.keymap.set("n", "<leader>h", function()
        local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
        vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = bufnr })
    end, { buffer = bufnr, desc = "Toggle Inlay Hints" })
end

function U.setup_diagnostics()
    vim.diagnostic.config({
        severity_sort = true,
        float = {
            border = "rounded",
            source = "if_many",
        },
        underline = {
            severity = vim.diagnostic.severity.ERROR,
        },
        signs = vim.g.have_nerd_font and {
            text = {
                [vim.diagnostic.severity.ERROR] = "❌",
                [vim.diagnostic.severity.WARN] = "⚠️",
                [vim.diagnostic.severity.INFO] = "ℹ️",
                [vim.diagnostic.severity.HINT] = "💡",
            },
        } or {},
        virtual_text = {
            source = "if_many",
            spacing = 2,
            format = function(diagnostic)
                return diagnostic.message
            end,
        },
    })
end

return U
