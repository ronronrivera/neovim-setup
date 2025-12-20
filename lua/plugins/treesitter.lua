return {

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua", "javascript", "c", "markdown", "markdown_inline", "cpp"
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

}
