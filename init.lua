require "opts"
require "launch"

require("plugin.colortheme")
vim.api.nvim_create_user_command("ReloadTheme", function()
    package.loaded["plugin.colortheme.lua"] = nil
    require("plugin.colortheme")
    print("Reset the color theme")
end, {})

spec("plugin.lualine")
spec("plugin.treesitter")
spec("plugin.telescope")
spec("plugin.fugitive")
spec("plugin.nvim-scrollbar")
spec("plugin.harpoon")
spec("plugin.undotree")
spec("plugin.mason")
spec("plugin.cmp")
spec("plugin.lsp-zero")
spec("plugin.gen")
spec("plugin.nvim-autopairs")
spec("plugin.smear_cursor")
spec("plugin.lspsaga")
spec("plugin.nvim-tree")

require "plugin.lazy"
require "keymaps"
