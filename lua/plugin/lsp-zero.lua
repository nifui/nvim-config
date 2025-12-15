local M = {
   "neovim/nvim-lspconfig",                -- required plugin identifier
   event = { "BufReadPre", "BufNewFile" }, -- optional lazy-load trigger
}
local function get_root(markers)
   local root = vim.fs.dirname(vim.fs.find(markers, { upward = true })[1])
   return root or vim.loop.cwd()
end
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
            cargo = {
               --change back to allFEature = true if breaks
               buildScripts = {
                  enable = false,
               },
            },
            procMacro = {
               enable = false, -- if you can live without it
            },
            checkOnSave = {
               command = "check", -- instead of clippy
            },
         },
      },
      capabilities = lsp_defaults,
   })
   -- vim.lsp.start({
   --    name = "asm_lsp",
   --    cmd = { "asm-lsp" },
   --    root_dir = get_root({ ".git", "Makefile", "makefile" }),
   --    filetypes = { "asm", "s", "S" },
   --    capabilities = lsp_defaults,
   --    settings = {
   --       asm_lsp = {
   --          -- options:
   --          -- dialect = "intel" | "att"
   --          -- includePaths = { "include/" }
   --       },
   --    },
   -- })
   -- C/C++/Objective-C — ccls
   vim.lsp.start({
      name = "ccls",
      cmd = { "ccls" }, -- make sure ccls is installed & in PATH
      root_dir = get_root({ "compile_commands.json", ".ccls", ".git" }),
      filetypes = { "c", "cc", "cpp", "cxx", "h", "hpp" },
      capabilities = lsp_defaults,
      init_options = {
         cache = {
            directory = ".ccls-cache",
         },
      },
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
