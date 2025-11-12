local M = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
}

function M.config()
    require("ibl").setup({
        indent = {
            char = "│",
            highlight = "IblIndent",
        },
        whitespace = {
            highlight = "IblWhitespace",
            remove_blankline_trail = true,
        },
        scope = {
            enabled = true,        -- highlight the current scope
            show_start = false,    -- draw a line at the start of the scope
            show_end = false,      -- you can enable this too if you want end markers
            highlight = "IblScope" -- the highlight group used for the current scope
        },
        exclude = {
            filetypes = {
                "help",
                "dashboard",
                "neo-tree",
                "lazy",
                "mason",
                "terminal",
                "TelescopePrompt",
                "TelescopeResults",
            },
            buftypes = { "terminal", "nofile" },
        },
    })

    -- Optional: customize colors for the indent and scope highlights
end

return M
