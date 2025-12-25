return {

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    { "williamboman/mason-lspconfig.nvim",
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
            -- Show diagnostics on hover
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

            -- LSP keymaps
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

            -- suppress WARN-level messages temporarily
            local old_notify = vim.notify
            vim.notify = function(msg, level, opts)
                if level == vim.log.levels.WARN then
                    return
                end
                old_notify(msg, level, opts)
            end

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                capabilities = capabilities
            })
            lspconfig.html.setup({
                capabilities = capabilities
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities
            })
            lspconfig.pyright.setup({
                capabilities = capabilities
            })

            -- restore notify
            vim.notify = old_notify
        end
    }

}
