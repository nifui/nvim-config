local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
}

function M.config()
  require("nvim-tree").setup({
    view = {
      width = 20,
      side = "right",
      relativenumber = false,
    },
    renderer = {
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "",
            arrow_open = "",
          },
        },
      },
    },
    filters = {
      dotfiles = false,
    },
    git = {
      enable = true,
    },
    diagnostics = {
      enable = true,
    },
  })
end

return M
