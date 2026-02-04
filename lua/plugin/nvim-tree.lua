local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
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
          width = 45,
          height = 25,
          row = math.floor((vim.o.lines - 25) / 2),
          col = math.floor((vim.o.columns - 45) / 2),
        },
      },
      width = 45,
      side = "right",
      relativenumber = false,
      number = false,
      signcolumn = "yes",
    },

    renderer = {
      root_folder_label = false,
      highlight_git = true,
      highlight_opened_files = "name",

      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        },
      },

      icons = {
        padding = " ",
        symlink_arrow = " ➜ ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
          },
        },
      },
    },

    filters = {
      dotfiles = false,
    },

    git = {
      enable = true,
      ignore = false,
    },

    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "󰌵",
        info = "󰋼",
        warning = "󰀪",
        error = "󰅚",
      },
    },

    update_focused_file = {
      enable = true,
      update_root = false,
    },
  })
end

return M
