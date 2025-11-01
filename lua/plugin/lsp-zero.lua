local M = {
   "neovim/nvim-lspconfig",                -- required plugin identifier
   event = { "BufReadPre", "BufNewFile" }, -- optional lazy-load trigger
}

function M.config()
   local lsp_defaults = vim.lsp.protocol.make_client_capabilities()
   local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
   lsp_defaults = vim.tbl_deep_extend("force", lsp_defaults, cmp_caps)

   -- Rust
   vim.lsp.start({
      name = "rust_analyzer",
      cmd = { "rust-analyzer" },
      root_dir = vim.fs.dirname(vim.fs.find({ "Cargo.toml", ".git" }, { upward = true })[1]),
      settings = {
         ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
         },
      },
      capabilities = lsp_defaults,
   })


   -- Diagnostics settings
   vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
   })

   -- You can attach keymaps manually when the client starts
   vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
         local buf = args.buf
         local opts = { buffer = buf }
         vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
         vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
         vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
         vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end,
   })
end

return M
