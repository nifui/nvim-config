local M = {
   "neovim/nvim-lspconfig",                -- required plugin identifier
   event = { "BufReadPre", "BufNewFile" }

}
local function get_root(markers)
   local root = vim.fs.dirname(vim.fs.find(markers, { upward = true })[1])
   return root or vim.loop.cwd()
end

local function start_lsp(ft, config)
   vim.api.nvim_create_autocmd("FileType", {
      pattern = ft,
      callback = function()
         vim.lsp.start(config)
      end,

   })
end

function M.config()
   local lsp_defaults = vim.lsp.protocol.make_client_capabilities()
   local lspconfig = require('lspconfig')
   local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
   lsp_defaults = vim.tbl_deep_extend("force", lsp_defaults, cmp_caps)
   lspconfig.rust_analyzer.setup({
      name = "rust_analyzer",
      cmd = { "rust-analyzer" },
      capabilities = lsp_defaults,
      root_dir = vim.fs.dirname(vim.fs.find({ "Cargo.toml", ".git" }, { upward = true })[1]),
      -- settings = {
      --    ["rust-analyzer"] = {
      --       cargo = {
      --          buildScripts = {
      --             enable = false,
      --          },
      --       },
      --       procMacro = {
      --          enable = true,
      --          ignored = {
      --             leptos_macro = {
      --                "server",
      --             }
      --          }
      --       },
      --       diagnostics = {
      --          enable = true,
      --       },
      --       checkOnSave = {
      --          command = "clippy",
      --          extraArgs = {
      --              "--all-targets",
      --              "--all-features",
      --              "--",
      --              "-Dwarnings",
      --              "-Wclippy::all",
      --              "-Wclippy::pedantic",
      --              "-Wclippy::nursery",
      --              "-Wclippy::cargo",
      --          },
      --       },
      --    },
      -- },
   })
   -- Asssembly
   -- start_lsp({ "asm", "s", "S" }, {
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
   -- -- C/C++/Objective-C — ccls
   -- start_lsp({ "c", "cc", "cpp", "cxx", "h", "hpp" }, {
   --    name = "ccls",
   --    cmd = { "ccls" }, -- make sure ccls is installed & in PATH
   --    root_dir = get_root({ "compile_commands.json", ".ccls", ".git" }),
   --    capabilities = lsp_defaults,
   --    init_options = {
   --       cache = {
   --          directory = ".ccls-cache",
   --       },
   --    },
   -- })
   -- -- Lua LSP
   -- start_lsp({ "lua" }, {
   --    name = "lua_ls",
   --    cmd = { "lua-language-server" },
   --    root_dir = get_root({ ".luarc.json", ".git" }),
   --    settings = {
   --       Lua = {
   --          diagnostics = { globals = { "vim" } },
   --          workspace = { checkThirdParty = false },
   --       },
   --    },
   -- })

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
end

return M
