local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
'/vue-language-server' .. '/node_modules/@vue/language-server';
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "rust_analyzer",
                "clangd",
                "vue_ls",
                "vtsls",
            },
        })
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local buf = args.buf
                local map = vim.keymap.set
                local opts = { buffer = buf }

                map("n", "gd", vim.lsp.buf.definition, opts)
                map("n", "K", vim.lsp.buf.hover, opts)
                map("n", "gr", vim.lsp.buf.references, opts)
                map("n", "<leader>rn", vim.lsp.buf.rename, opts)
                map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })
        -- Rust
        vim.lsp.config.rust_analyzer = {
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    cargo = { allFeatures = true },
                },
            },
        }
        -- C / C++
        vim.lsp.config.clangd = {
            capabilities = capabilities,
        }
        -- Vue (Vue 3 + TS)
        vim.lsp.config.vue_ls = {
            capabilities = capabilities,
        }

        -- TypeScript (non-Vue files)
        vim.lsp.config.vtsls = {
            capabilities = capabilities,
            settings = {
                vtsls = {
                    tsserver = {
                        globalPlugins = {
                            vue_plugin,
                        },
                    },
                },
            },
            filetypes = tsserver_filetypes,
        }
        ------------------------------------------------------------
        -- Enable servers
        ------------------------------------------------------------
        vim.lsp.enable({
            "rust_analyzer",
            "clangd",
            "vue_ls",
            "vtsls",
        })
        ------------------------------------------------------------
        -- Diagnostics
        ------------------------------------------------------------
        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
            update_in_insert = false,
        })
    end,
}
