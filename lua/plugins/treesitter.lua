return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        config = function()
            -- Install requested parsers if they are not already installed
            local ensure_installed = {
                "lua",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "json",
                "c",
                "cpp",
            }
            local already_installed = require("nvim-treesitter.config").get_installed()
            local parsers_to_install = vim.iter(ensure_installed)
                :filter(function(parser)
                    return not vim.tbl_contains(already_installed, parser)
                end)
                :totable()

            if #parsers_to_install > 0 then
                require("nvim-treesitter").install(parsers_to_install)
            end

            -- Enable Treesitter highlighting (native to Neovim 0.12+)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local ft = vim.bo[args.buf].filetype
                    if ft ~= "markdown" and ft ~= "markdown_inline" then
                        pcall(vim.treesitter.start)
                    end
                end,
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
