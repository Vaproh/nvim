return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                separator_style = "thin", -- straight, minimal separators
                show_buffer_close_icons = true, -- show close button per buffer
                show_close_icon = false,        -- hide global close icon
                show_tab_indicators = false,
                always_show_bufferline = true,
                diagnostics = false,
                indicator = {
                    icon = "▎", -- subtle left bar
                    style = "icon",
                },
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = false,
                    },
                },
            },
        })
    end,
}

