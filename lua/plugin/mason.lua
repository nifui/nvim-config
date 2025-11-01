local M = {
   'williamboman/mason.nvim',
   dependencies = {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'nvim-lua/plenary.nvim',
   },
}

M.servers = {
   "lua-language-server",
   "clangd",
   "rust-analyzer",
}

function M.config()
   require("mason").setup()
   require("mason-tool-installer").setup({
      ensure_installed = M.servers,
   })
   vim.diagnostic.config({
      virtual_text = true,
      underline = true,
      update_in_insert = false,
   })
   vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
         local buf = args.buf
         local opts = { buffer = buf }
         local map = vim.keymap.set

         map("n", "K", vim.lsp.buf.hover, opts)
         map("n", "gd", vim.lsp.buf.definition, opts)
         map("n", "gr", vim.lsp.buf.references, opts)
         map("n", "<leader>rn", vim.lsp.buf.rename, opts)
         map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
   })
   vim.api.nvim_create_autocmd("FileType", {
      pattern = "lua",
      callback = function()
         vim.lsp.start({
            name = "lua_ls",
            cmd = { "lua-language-server" },
            root_dir = vim.fs.dirname(vim.fs.find({ ".luarc.json", ".git" }, { upward = true })[1]),
            settings = {
               Lua = {
                  diagnostics = { globals = { "vim" } },
                  workspace = { checkThirdParty = false },
               },
            },
         })
      end,
   })

   vim.api.nvim_create_autocmd("FileType", {
      pattern = "rust",
      callback = function()
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
         })
      end,
   })

   vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp" },
      callback = function()
         vim.lsp.start({
            name = "clangd",
            cmd = { "clangd" },
            root_dir = vim.fs.dirname(vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1]),
         })
      end,
   })
end

return M
