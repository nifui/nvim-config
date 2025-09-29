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
  "nvim-treesitter/nvim-treesitter",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "neovim/nvim-lspconfig",

  -- Completion engine and sources
  "hrsh7th/nvim-cmp",              -- Completion plugin
  "hrsh7th/cmp-nvim-lsp",          -- LSP source for nvim-cmp
  "hrsh7th/cmp-buffer",            -- Buffer source
  "hrsh7th/cmp-path",              -- Filesystem paths
  "hrsh7th/cmp-cmdline",           -- Cmdline completions
  "L3MON4D3/LuaSnip",              -- Snippet engine
  "saadparwaiz1/cmp_luasnip",      -- Snippet completions
})
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  local keymap = vim.keymap.set
  keymap('n', 'gd', vim.lsp.buf.definition, opts)
  keymap('n', 'K', vim.lsp.buf.hover, opts)
  keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
  keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  keymap('n', 'gr', vim.lsp.buf.references, opts)
end


local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.ts_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
}
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      check = {
        command = "clippy",
      },
    }
  }
}

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
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
