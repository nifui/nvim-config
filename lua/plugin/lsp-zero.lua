local M = {
   'VonHeikemen/lsp-zero.nvim',
   branch = "v1.x",
   dependencies = {
      -- LSP support
      'neovim/nvim-lspconfig',

      -- Autocompletetion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
   },
}
function M.config()
   local lsp = require("lsp-zero").preset({})
   lsp.ensure_installed({
      'lua_ls',
      'rust_analyzer'
   })
   require('lspconfig').rust_analyzer.setup({
      settings = {
         ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
         }
      }
   })
   require('lspconfig').lua_ls.setup({
      settings = {
         Lua = {
            diagnostics = { globals = { 'vim' } }
         }
      }
   })
   lsp.setup()
end   

return M