vim.g.mapleader = " "
vim.o.mouse = ""

vim.o.termguicolors = true
vim.o.updatetime = 200
vim.o.autoread = true
vim.o.undofile = true

vim.o.number = true
vim.o.relativenumber = true

-- completions menu
vim.o.completeopt = "menu,menuone,noselect,preview"
vim.o.pumheight = 10
vim.o.winborder = "rounded"
vim.o.showmode = false

vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.scrolloff = 8

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.wrap = false
vim.o.breakindent = true

vim.diagnostic.config({ virtual_text = true }) -- inline diagnostics
vim.opt.clipboard:append{'unnamedplus'}
