-- lua/opts.lua

-- Set leader
vim.g.mapleader = " "

-- Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab / indent
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search / UI
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50

-- Undo / swap
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Handle undo directory cross-platform
if vim.loop.os_uname().sysname == "Windows_NT" then
   vim.opt.undodir = os.getenv("UserProfile") .. "\\.vim\\undodir"
   vim.opt.shell = "powershell"
   vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
else
   vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
   -- No need to set shell on Unix — leave default (usually bash/sh)
end
