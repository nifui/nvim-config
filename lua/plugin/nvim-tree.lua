local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
}

function M.config()
  require("nvim-tree").setup({
    view = {
      float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 40,
          height = 20,
          row = 0,
          col = 0,
        }
      },
      width = 40,
      side = "right",
      relativenumber = false,

    },
    renderer = {
      indent_markers = {
        enable = true,
        icons = {
          corner = "╰",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        }
      },
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
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
