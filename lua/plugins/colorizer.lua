return {


    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                filetypes = {
                    "css",
                    "scss",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                },
                user_default_options = {
                    RGB = true,
                    RRGGBB = true,
                    names = false,
                    css = true,
                    css_fn = true,
                    tailwind = true,
                    mode = "virtualtext",
                    virtualtext="■",
                },
            })
        end,
    },


    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
        end,
    },
}
