return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "pyright",
                    "jsonls",
                    "html",
                    "cssls",
                    "ts_ls",
                    "tailwindcss",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.api.nvim_create_autocmd({ "FileType" }, {
                pattern = { "markdown", "markdown_inline" },
                callback = function(args)
                    local buf = args.buf
                    vim.schedule(function()
                        if vim.api.nvim_buf_is_valid(buf) then
                            pcall(vim.treesitter.stop, buf)
                            vim.bo[buf].syntax = 'markdown'
                        end
                    end)
                end,
            })

            vim.o.updatetime = 300
            vim.api.nvim_create_autocmd("CursorHold", {
                callback = function()
                    vim.diagnostic.open_float(nil, {
                        focus = false,
                        scope = "cursor",
                        border = "rounded",
                    })
                end,
            })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

            local servers = {
                "lua_ls",
                "ts_ls",
                "cssls",
                "html",
                "jsonls",
                "pyright",
                "clangd",
                "tailwindcss",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, { capabilities = capabilities })
                vim.lsp.enable(server)
            end
        end
    }
}
