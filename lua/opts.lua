-- lua/opts.lua

-- Set leader
vim.g.mapleader = " "
vim.o.autowriteall = false
vim.api.nvim_create_autocmd("BufWritePre", {
   pattern = "*.rs",
   callback = function()
      vim.lsp.buf.format({ async = false })
   end,
})

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.iskeyword:remove('.')

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
vim.opt.backup = true
vim.opt.undofile = true
vim.opt.colorcolumn = ""
-- Handle undo directory cross-platform
if vim.loop.os_uname().sysname == "Windows_NT" then
   vim.opt.undodir = os.getenv("UserProfile") .. "\\.vim\\undodir"
   vim.opt.shell = "powershell"
   --prevent the shell from autoexiting s
   vim.opt.shellcmdflag = "-NoLogo -NoExit -NoProfile -ExecutionPolicy RemoteSigned -Command"
else
   vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
   -- No need to set shell on Unix — leave default (usually bash/sh)
end

-- vscode mimic settings

vim.opt.virtualedit = "onemore"
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.iskeyword:append("-")

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.clipboard = "unnamedplus"
