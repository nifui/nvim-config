require "opts"
require "launch"

require("plugin.colortheme")
vim.api.nvim_create_user_command("ReloadTheme", function()
    package.loaded["plugin.colortheme.lua"] = nil
    require("plugin.colortheme")
    print("Reset the color theme")
end, {})

spec("plugin.lualine")
--should probably configure this a bit more just using a template rn
spec("plugin.treesitter")
spec("plugin.telescope")
--spec("plugin.fugitive")
spec("plugin.nvim-scrollbar")
spec("plugin.harpoon")
--spec("plugin.undotree")
spec("plugin.mason")
spec("plugin.cmp")
spec("plugin.lsp-zero")
--spec("plugin.gen")
spec("plugin.toggleterm")
spec("plugin.nvim-autopairs")
spec("plugin.smear_cursor")
--spec("plugin.lspsaga")
spec("plugin.md")
spec("plugin.nvim-tree")
spec("plugin.indentline")
-- should probably add a setting that launches a minimal nvim setup for low battery life on laptop
vim.cmd("highlight! IblIndent guifg=#5c4a72 gui=nocombine")
vim.cmd("highlight! IblWhitespace guifg=#d16cbd gui=nocombine")
vim.cmd("highlight! IblScope guifg=#B22222 gui=nocombine")

--spec("plugin.alpha-nvim")
require "plugin.lazy"
require "keymaps"
