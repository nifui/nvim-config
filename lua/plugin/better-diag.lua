local M = {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,

}
function M.config()
    require("tiny-inline-diagnostic").setup({
        preset = "powerline",
        options = {
            multilines = {
                enabled = true,
            },
            show_source = {
                enabled = true,
            },
            add_messages = {
                messages = true,
            }
        }
    })
    vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostic
end

return M
