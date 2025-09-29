local lazypath = vim.fn.stdpath("data") .. "/site/pack/lazy/start/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  -- Example plugins:
  "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
  "nvim-lua/plenary.nvim",            -- Lua utilities (dependency for many plugins)
  "nvim-telescope/telescope.nvim",    -- Fuzzy finder
})




vim.g.mapleader = " "
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.opt.undofile = true
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
