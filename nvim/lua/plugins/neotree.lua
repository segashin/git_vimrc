return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        vim.keymap.set('n', '<leader>ft', ':Neotree filesystem toggle<CR>', {})
        local neotree = require("neo-tree")
        neotree.setup({
            window = {
                mappings = {
                    ["N"] = { "add", config = { show_path = "none" } },
                    ["y"] = { "copy" },
                },
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                }
            }
        })
    end
}
