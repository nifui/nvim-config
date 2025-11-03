local M = {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
}
function M.config()
    require("toggleterm").setup {
        size = 20,
        open_mapping = nil,
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        direction = 'float',
        close_on_exit = false,
        shell = vim.o.shell,
        float_opts = {
            border = 'curved',
            winblend = 0,
        },
    }
end

return M
