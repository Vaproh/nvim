return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local empty = require("lualine.component"):extend()
        function empty:draw(default_highlight)
            self.status = ""
            self.applied_separator = ""
            self:apply_highlights(default_highlight)
            self:apply_section_separators()
            return self.status
        end

        local function process_sections(sections)
            for name, section in pairs(sections) do
                local left = name:sub(9, 10) < "x"
                for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
                    table.insert(section, pos * 2, { empty })
                end
                for id, comp in ipairs(section) do
                    if type(comp) ~= "table" then
                        comp = { comp }
                        section[id] = comp
                    end
                    comp.separator = left and { right = "" } or { left = "" }
                end
            end
            return sections
        end

        local function search_result()
            if vim.v.hlsearch == 0 then
                return ""
            end
            local last_search = vim.fn.getreg("/")
            if last_search == "" then
                return ""
            end
            local searchcount = vim.fn.searchcount({ maxcount = 9999 })
            return " " .. last_search .. " (" .. searchcount.current .. "/" .. searchcount.total .. ")"
        end

        local function modified()
            if vim.bo.modified then
                return "+"
            end
            if not vim.bo.modifiable or vim.bo.readonly then
                return "-"
            end
            return ""
        end

        local function nvim_mode()
            local mode_map = {
                ["n"] = "NORMAL",
                ["no"] = "O-PENDING",
                ["v"] = "VISUAL",
                ["V"] = "V-LINE",
                [""] = "V-BLOCK",
                ["i"] = "INSERT",
                ["ic"] = "INSERT",
                ["R"] = "REPLACE",
                ["Rv"] = "V-REPLACE",
                ["c"] = "COMMAND",
                ["cv"] = "EX",
                ["ce"] = "EX",
                ["r"] = "PROMPT",
                ["rm"] = "MORE",
                ["r?"] = "CONFIRM",
                ["!"] = "SHELL",
                ["t"] = "TERMINAL",
            }
            local code = vim.api.nvim_get_mode().mode
            return " " .. (mode_map[code] or code)
        end

        local function fileformat_icon()
            local icon = {
                unix = "",
                dos = "",
                mac = "",
            }
            return icon[vim.bo.fileformat] or vim.bo.fileformat
        end

        local function lsp_indicator()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            return (next(clients) ~= nil) and "" or ""
        end

        local function hide_in_special_buffers()
            local ft = vim.bo.filetype
            local excluded = {
                "alpha",
                "dashboard",
                "NvimTree",
                "neo-tree",
                "TelescopePrompt",
                "lazy",
                "mason",
                "toggleterm",
            }
            return not vim.tbl_contains(excluded, ft)
        end

        require("lualine").setup({
            options = {
                theme = "auto",
                component_separators = "",
                section_separators = { left = "", right = "" },
                globalstatus = false,
                disabled_filetypes = {
                    statusline = { "alpha", "dashboard", "NvimTree", "neo-tree", "lazy", "mason", "toggleterm" },
                    winbar = {},
                },
            },
            sections = process_sections({
                lualine_a = {
                    {
                        nvim_mode,
                        padding = { left = 1, right = 1 },
                        cond = hide_in_special_buffers,
                    },
                },
                lualine_b = {
                    { "branch", icon = "", cond = hide_in_special_buffers },
                },
                lualine_c = {
                    { "diff",   cond = hide_in_special_buffers },
                    {
                        "filename",
                        file_status = false,
                        path = 1,
                        symbols = { modified = " ●", readonly = " " },
                        cond = hide_in_special_buffers,
                    },
                    { modified, cond = hide_in_special_buffers },
                    {
                        "%w",
                        cond = function()
                            return vim.wo.previewwindow and hide_in_special_buffers()
                        end,
                    },
                    {
                        "%r",
                        cond = function()
                            return vim.bo.readonly and hide_in_special_buffers()
                        end,
                    },
                    {
                        "%q",
                        cond = function()
                            return vim.bo.buftype == "quickfix" and hide_in_special_buffers()
                        end,
                    },
                },
                lualine_x = {
                    { search_result,   cond = hide_in_special_buffers },
                    { fileformat_icon, cond = hide_in_special_buffers },
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        sections = { "error", "warn", "info", "hint" },
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = " ",
                        },
                        diagnostics_color = {
                            error = { fg = "#e86671" },
                            warn = { fg = "#e5c07b" },
                            info = { fg = "#56b6c2" },
                            hint = { fg = "#98c379" },
                        },
                        cond = hide_in_special_buffers,
                    },
                    {
                        lsp_indicator,
                        cond = hide_in_special_buffers,
                        color = { fg = "#61afef" },
                    },
                    { "filetype", cond = hide_in_special_buffers },
                },
                lualine_y = {
                    { "%l:%c", cond = hide_in_special_buffers },
                },
                lualine_z = {
                    { "%p%%/%L", cond = hide_in_special_buffers },
                },
            }),
            inactive_sections = {
                lualine_c = { "%f %y %m" },
                lualine_x = {},
            },
        })
    end,
}
