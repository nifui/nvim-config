local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}

function M.config()
    local noice = require("noice")

    noice.setup({
        lsp = {
            progress = {
                enabled = true,
            },
            hover = {
                enabled = true,
                silent = false,
            },
            signature = {
                enabled = true,
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },

        cmdline = {
            enabled = true,
            view = "cmdline_popup",
            format = {
                cmdline = { icon = "" },
                search_down = { icon = " " },
                search_up = { icon = " " },
                filter = { icon = "$" },
                lua = { icon = "" },
            },
        },

        messages = {
            enabled = true,
            view = "notify",
            view_error = "notify",
            view_warn = "notify",
            view_history = "messages",
        },

        notify = {
            enabled = true,
            view = "notify",
        },

        popupmenu = {
            enabled = true,
            backend = "nui",
        },

        views = {
            cmdline_popup = {
                position = {
                    row = "40%",
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
                border = {
                    style = "rounded",
                },
            },

            popupmenu = {
                border = {
                    style = "rounded",
                },
            },
        },


    })
end

return M
