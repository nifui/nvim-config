-- ~/.config/nvim/init.lua

-- Set leader key
vim.g.mapleader = " "

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Tabs & indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Enable mouse
vim.o.mouse = "a"

-- Enable clipboard
vim.o.clipboard = "unnamedplus"

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true

-- Colors
vim.o.termguicolors = true

-- Save undo history
vim.opt.undofile = true

-- Basic keymap example
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
