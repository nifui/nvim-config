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
      'onsails/lspkind.nvim',
      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
   },
}
function M.config()
   local lsp = require("lsp-zero").preset({})
   lsp.ensure_installed({
      'lua_ls',
      'rust_analyzer',
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
   local cmp = require('cmp')
   local luasnip = require('luasnip')
   local lspkind = require('lspkind')
   local rounded_border = {
      { "╭", "CmpBorder" },
      { "─", "CmpBorder" },
      { "╮", "CmpBorder" },
      { "│", "CmpBorder" },
      { "╯", "CmpBorder" },
      { "─", "CmpBorder" },
      { "╰", "CmpBorder" },
      { "│", "CmpBorder" },
   }
   cmp.setup({
      formatting = {
         format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth=75,
            ellipsis_char = '...',
         })
      },
      window = {
         completion = {
            border="rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
         },
      },
      sources = cmp.config.sources({
         { name = 'nvim_lsp' },
         { name = 'luasnip' },
         { name = 'buffer' },
         { name = 'path' },
      }),
   })

end

return M