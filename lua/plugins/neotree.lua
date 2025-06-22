return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- optional but recommended
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<C-n>",      "<CMD>Neotree toggle right<CR>",         desc = "Toggle NeoTree (Right)" },
        { "<leader>nb", "<CMD>Neotree buffers reveal float<CR>", desc = "NeoTree Buffers (Float)" },
        { "<leader>ng", "<CMD>Neotree git_status float<CR>",     desc = "NeoTree Git Status (Float)" },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            use_popups_for_input = false, -- cleaner CLI inputs
            default_component_configs = {
                indent = {
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└",
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    default = "",
                },
                modified = {
                    symbol = "●",
                    highlight = "NeoTreeModified",
                },
                git_status = {
                    symbols = {
                        added = "✚",
                        modified = "",
                        deleted = "✖",
                        renamed = "󰁕",
                        untracked = "",
                        ignored = "",
                        unstaged = "󰄱",
                        staged = "",
                        conflict = "",
                    },
                },
            },
            sources = { "filesystem", "buffers", "git_status" },
            source_selector = {
                winbar = false,
                statusline = false,
            },
            filesystem = {
                follow_current_file = { enabled = true },
                hijack_netrw_behavior = "open_default",
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    show_hidden_count = true,
                    never_show = {
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
            },
            buffers = {
                follow_current_file = { enabled = true },
                group_empty_dirs = true,
                show_unloaded = true,
            },
            git_status = {
                window = {
                    position = "float",
                },
            },
        })
    end,
}
