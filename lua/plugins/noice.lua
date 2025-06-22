return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        cmdline = {
            enabled = true,
            view = "cmdline_popup",
            format = {
                cmdline = { icon = "" },
                search_down = { icon = " " },
                search_up = { icon = " " },
                filter = { icon = "" },
                lua = { icon = "" },
                help = { icon = "" },
            },
        },
        messages = {
            enabled = true,
            view = "mini", -- use "notify" for full-screen notify style
            view_error = "popup",
            view_warn = "popup",
            view_history = "messages",
        },
        popupmenu = {
            enabled = true,
            backend = "nui", -- or "cmp" if you're using nvim-cmp
        },
        lsp = {
            progress = {
                enabled = true,
                format = " %t",
                throttle = 1000,
                view = "mini",
            },
            hover = { enabled = true },
            signature = { enabled = true },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = true,
        },
        views = {
            cmdline_popup = {
                position = {
                    row = "40%",
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
                border = {
                    style = "rounded",
                },
                win_options = {
                    winhighlight = {
                        Normal = "NormalFloat",
                        FloatBorder = "FloatBorder",
                    },
                },
            },
            mini = {
                win_options = {
                    winblend = 10,
                },
            },
        },
    },
}
