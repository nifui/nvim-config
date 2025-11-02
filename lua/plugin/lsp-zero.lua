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
            checkOnSave = true,
         },
      },
      capabilities = lsp_defaults,
   })
   vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
      pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
      callback = function()
         if vim.lsp.get_clients({ name = "tsserver" })[1] then
            return
         end
         vim.lsp.start({
            name = "tsserver",
            cmd = { "typescript-language-server", "--stdio" },
            root_dir = get_root({ "tsconfig.json", "package.json", ".git" }),
            capabilities = lsp_defaults,
            single_file_support = true,
            init_options = {
               hostInfo = "neovim",
            },
         })
      end,
   })
   vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
      pattern = "*.vue",
      callback = function()
         vim.lsp.start({
            name = "volar",
            cmd = { "vue-language-server", "--stdio" },
            root_dir = get_root({ "package.json", "tsconfig.json", "vue.config.js", ".git" }),
            capabilities = lsp_defaults,
            single_file_support = true,
            init_options = {
               typescript = {
                  tsdk = vim.fn.stdpath("data") .. "/mason/packages/typescript/lib", -- optional if using Mason
               },
            },
         })
      end,
   })
   vim.lsp.inlay_hint.enable(true)

   vim.diagnostic.config({
      virtual_text = true,
      signs = false,
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
