vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- INFO: using telescope to see diagnostics
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to location list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

-- INFO: uncomment if you not use a movement plugin,
-- my config uses mini.move plugin, turning this map unnecessary
--
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line below (keep cursor)" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over (keep register)" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank (copy) to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank (copy) line to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void" })

-- INFO: this map came directly from the ThePrimeagen configuration in this video:
-- https://youtu.be/w7i4amO_zaE
--
-- WARN: This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Quit nvim" })
--

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Q" })

-- INFO: i'm not using tmux, don't know what this do
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Open tmux sessionizer")

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end, { desc = "Format buffer" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Quickfix next" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Quickfix previous" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Location list next" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Location list previous" })

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
--         {
--                 desc = "Search and replace word under cursor",
--         }
-- )
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })

-- INFO: only useful if proggraming in go
-- vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", "Insert go error check")

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/gabrvendrame/lazy.lua<CR>", { desc = "Edit lazy config" })

vim.keymap.set("n", "<leader>vim", function()
    local myvimrc = vim.fn.expand("$MYVIMRC")
    local dirname = vim.fn.fnamemodify(myvimrc, ":h")

    vim.cmd("Ex " .. dirname)
end, { desc = "Opem nvim config directory" })
