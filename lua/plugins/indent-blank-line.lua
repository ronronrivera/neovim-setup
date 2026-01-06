return {

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = {
                enabled = true,
            },
            indent = {
                char = "│",
            },
        },
        keys = {
            { "<c-I>", "<cmd>IBLToggle<CR>", desc = "Toggle indent guides" },
            { "<leader>ts", "<cmd>IBLToggleScope<CR>", desc = "Toggle indent scope" },
        },
    }
}
