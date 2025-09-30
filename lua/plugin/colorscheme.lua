local M = {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
}
function M.config() 
    require("cyberdream").setup({
        variant = "default",
        transparent=true,
        saturation =0.5,
        italic_comments=true,
        cache=false,
    })


    vim.cmd("colorscheme cyberdream")
end
return M