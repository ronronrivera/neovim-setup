return {

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-t>]],
                direction = "float",
                float_opts = {
                    border = "rounded",
                },
            })
        end,
    }
}
