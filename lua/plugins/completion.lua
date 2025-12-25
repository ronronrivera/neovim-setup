return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies={
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        }
    },

    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require'cmp'
            require("luasnip.loaders.from_vscode").lazy_load()

            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { vim.fn.stdpath("data") .. "/lazy/friendly-snippets" }, -- optional, usually auto-detected
                include = { "javascriptreact", "typescriptreact", "javascript", "typescript", "react-native" },
            })


            local luasnip = require("luasnip")
            vim.keymap.set("i", "<C-k>", function() luasnip.expand_or_jump() end, { silent = true })
            vim.keymap.set("s", "<C-k>", function() luasnip.expand_or_jump() end, { silent = true })
            vim.keymap.set("i", "<C-j>", function() luasnip.jump(-1) end, { silent = true })
            vim.keymap.set("s", "<C-j>", function() luasnip.jump(-1) end, { silent = true })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },                 }, {
                        { name = 'buffer' },
                    }),
                formatting = {
                    format = function(entry, item)
                        item = require("tailwindcss-colorizer-cmp").formatter(entry, item)
                        return item
                    end,
                },
            })
        end,
    },

}
