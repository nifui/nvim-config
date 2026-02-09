return {
    "petertriho/nvim-scrollbar",
    config = function()
        require("scrollbar").setup({
            handle = {
                color = "#444444",
                blend = 20,
                width = 3,
            },
            marks = {
                Cursor = {
                    text = "█",
                    color = "#1C59AF"
                },
                Error  = { color = "#FF0000" },
                Warn   = { color = "#FFFF00" },
                Info   = { color = "#0000FF" },
                Hint   = { color = "#00FF00" },
            },
        })
    end,
}
