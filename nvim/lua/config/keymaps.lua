-- disable space bar in normal and visual mode (used as leader key)
vim.keymap.set({ "n", "v" }, "<leader>", "<nop>")

-- clear search highlights
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Paste without yanking replaced text
vim.keymap.set("n", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- maintain selection after indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- move lines up/down
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- center buffer when jumping to next/previous search result
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- split navigation
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move to bottom split" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move to top split" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move to right split" })

-- create new splits
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split window horizontally" })

-- close current split window
vim.keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current split" })

-- buffer navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- delete current buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- toggle inlay hints
vim.keymap.set("n", "<leader>h", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	vim.notify(vim.lsp.inlay_hint.is_enabled() and "Inlay Hints Enabled" or "Inlay Hints Disabled")
end, { desc = "Toggle LSP inlay hints" })
