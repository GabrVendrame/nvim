require("gabrvendrame.remap")
require("gabrvendrame.set")
require("gabrvendrame.lazy")

vim.cmd.colorscheme("tokyonight")

local utils = require("gabrvendrame.utils")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local clear_autocmds = vim.api.nvim_clear_autocmds

local yank_group = augroup("HighlightYank", { clear = true })
local lsp_hl_group = augroup("LspHighlight", {})
local lsp_attach_group = augroup("LspAttach", { clear = true })
local lsp_detach_group = augroup("LspDetach", { clear = true })

local function setup_lsp_highlight(client, bufnr)
        local method = vim.lsp.protocol.Methods.textDocument_documentHighlight

        local is_supported = client:supports_method(method)
        if not is_supported then
                return
        end

        autocmd({ "CursorHold", "CursorHoldI" }, {
                group = lsp_hl_group,
                buffer = bufnr,
                callback = vim.lsp.buf.document_highlight,
        })

        autocmd({ "CursorMoved", "CursorMovedI" }, {
                group = lsp_hl_group,
                buffer = bufnr,
                callback = vim.lsp.buf.clear_references,
        })
end

autocmd("TextYankPost", {
        desc = "Highlight when yanking",
        group = yank_group,
        callback = function()
                vim.hl.on_yank()
        end,
})

autocmd("LspAttach", {
        group = lsp_attach_group,
        callback = function(event)
                local buf = event.buf
                local client = vim.lsp.get_client_by_id(event.data.client_id)

                utils.set_keymaps(buf)
                setup_lsp_highlight(client, buf)
                utils.setup_inlay_hints(client, buf)
        end,
})

autocmd("LspDetach", {
        group = lsp_detach_group,
        callback = function(event)
                clear_autocmds({ group = "LspHighlight", buffer = event.buf })
                vim.lsp.buf.clear_references()
        end,
})
