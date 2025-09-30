local M = {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    event = "BufReadPost"
  }

function M.config()
    require "nvim-treesitter.configs".setup {
        ensure_installed = { "lua", "rust" },
        sync_install = true,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    }
end

return M