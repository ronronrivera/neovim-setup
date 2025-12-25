return {

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true, -- use treesitter if available
                disable_filetype = { "TelescopePrompt", "vim" },
            })
        end,
    }

}
