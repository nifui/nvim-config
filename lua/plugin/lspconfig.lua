local M = {
   "neovim/nvim-lspconfig",
   event = { "BufReadPre", "BufNewFile" }
}

function M.config()
   local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

   vim.lsp.config("rust_analyzer", {
      cmd = { "rust-analyzer" },
      capabilities = cmp_caps,
      root_dir = function(bufnr, on_dir)
         local fname = vim.api.nvim_buf_get_name(bufnr)
         local root = vim.fs.dirname(
            vim.fs.find({ "Cargo.toml", ".git" }, { upward = true, path = fname })[1]
         )
         on_dir(root)
      end,
      settings = {
         ["rust-analyzer"] = {
            cargo = {
               buildScripts = {
                  enable = false,
               },
            },
            procMacro = {
               enable = true,
               ignored = {
                  leptos_macro = {
                     "server",
                  }
               }
            },
            diagnostics = {
               enable = true,
            },
            check = {
               command = "clippy",
               extraArgs = {
                  "--no-deps",
                  "--",
                  "-W", "clippy::pedantic",
                  "-W", "clippy::nursery",
               },
            },
            lens = {
               enable = false,
            },
         },
      },
   })

   vim.lsp.enable("rust_analyzer")
end

vim.api.nvim_create_autocmd("LspAttach", {
   callback = function(args)
      vim.lsp.inlay_hint.enable(true)
   end,
})

vim.diagnostic.config({
   virtual_text = true,
   signs = false,
   underline = true,
   update_in_insert = false,
})

return M
