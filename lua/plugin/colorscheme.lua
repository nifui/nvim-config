local M = {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
}
function M.config() 
    vim.cmd.colorscheme "cyberdream"
end
return M