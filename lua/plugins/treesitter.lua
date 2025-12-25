return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua",
                    "javascript",
                    "typescript",
                    "tsx",
                    "html",
                    "css",
                    "json",
                    "markdown",
                    "markdown_inline",
                    "c",
                    "cpp",
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    {
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-ts-autotag").setup({
                filetypes = { "html", "xml", "javascript", "typescriptreact", "tsx", "vue" },
            })
        end,
    },
}
