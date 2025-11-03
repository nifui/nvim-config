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


   local function get_root(markers)
      local root = vim.fs.find(markers, { upward = true })[1]
      return root and vim.fs.dirname(root) or vim.fn.getcwd()
   end

   ---------------------------------------------------------------------------
   -- Lua
   ---------------------------------------------------------------------------
   vim.api.nvim_create_autocmd("FileType", {
      pattern = "lua",
      callback = function()
         vim.lsp.start({
            name = "lua_ls",
            cmd = { "lua-language-server" },
            root_dir = get_root({ ".luarc.json", ".git" }),
            settings = {
               Lua = {
                  diagnostics = { globals = { "vim" } },
                  workspace = { checkThirdParty = false },
               },
            },
         })
      end,
   })

   ---------------------------------------------------------------------------
   -- Rust
   ---------------------------------------------------------------------------
   vim.api.nvim_create_autocmd("FileType", {
      pattern = "rust",
      callback = function()
         vim.lsp.start({
            name = "rust_analyzer",
            cmd = { "rust-analyzer" },
            root_dir = get_root({ "Cargo.toml", ".git" }),
            settings = {
               ["rust-analyzer"] = {
                  cargo = { allFeatures = true },
                  checkOnSave = true,
               },
            },
         })
      end,
   })

   ---------------------------------------------------------------------------
   -- C / C++
   ---------------------------------------------------------------------------
   vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp" },
      callback = function()
         vim.lsp.start({
            name = "clangd",
            cmd = { "clangd" },
            root_dir = get_root({ "compile_commands.json", ".git" }),
         })
      end,
   })
   vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile", "FileType" }, {
      pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
      callback = function()
         if vim.lsp.get_clients({ name = "vtsls" })[1] then
            return
         end
         vim.lsp.start({
            name = "vtsls",
            cmd = { "vtsls", "--stdio" },
            root_dir = get_root({ "tsconfig.json", "package.json", ".git" }),
            capabilities = lsp_defaults,
            single_file_support = true,
            init_options = {
               hostInfo = "neovim",
            },
         })
      end,
   })

   vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile", "FileType" }, {
      pattern = "*.vue",
      callback = function()
         if vim.lsp.get_clients({ name = "vue_ls" })[1] then
            return
         end
         print("detected vue file attempting to run lsp")
         local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
         local vue_plugin = {
            name = "@vue/typescript-plugin",
            location = mason_path .. "/vue-language-server/node_modules/@vue/typescript-plugin",
            languages = { "vue" },
            configNamespace = "typescript",
         }

         vim.lsp.start({
            name = "vue_ls",
            cmd = { "vue-language-server", "--stdio" },
            root_dir = get_root({ "package.json", "tsconfig.json", "vue.config.js", ".git" }),
            capabilities = lsp_defaults,
            single_file_support = true,
            init_options = {
               plugins = { vue_plugin },
               typescript = {
                  tsdk = mason_path .. "/typescript/lib",
               },
            },
         })
      end,
   })
end

return M
