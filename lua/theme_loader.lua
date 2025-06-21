local M = {}

local function set_transparent()
  vim.cmd([[
    hi Normal guibg=NONE ctermbg=NONE
    hi NormalNC guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
    hi VertSplit guibg=NONE ctermbg=NONE
    hi StatusLine guibg=NONE ctermbg=NONE
    hi TabLine guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi Folded guibg=NONE ctermbg=NONE
    hi Pmenu guibg=NONE ctermbg=NONE
  ]])
end

local theme_map = {
  ["catppuccin-frappe"] = function()
    require("catppuccin").setup({ flavour = "frappe", transparent_background = true })
    vim.cmd.colorscheme("catppuccin-frappe")
  end,
  ["catppuccin-macchiato"] = function()
    require("catppuccin").setup({ flavour = "macchiato", transparent_background = true })
    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
  ["catppuccin-mocha"] = function()
    require("catppuccin").setup({ flavour = "mocha", transparent_background = true })
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
  ["dracula"] = function()
    vim.cmd.colorscheme("dracula")
    set_transparent()
  end,
  ["everforest-dark-hard"] = function()
    vim.g.everforest_background = "hard"
    vim.g.everforest_transparent_background = 1
    vim.cmd.colorscheme("everforest")
  end,
  ["everforest-dark-medium"] = function()
    vim.g.everforest_background = "medium"
    vim.g.everforest_transparent_background = 1
    vim.cmd.colorscheme("everforest")
  end,
  ["everforest-dark-soft"] = function()
    vim.g.everforest_background = "soft"
    vim.g.everforest_transparent_background = 1
    vim.cmd.colorscheme("everforest")
  end,
  ["gruvbox-dark"] = function()
    vim.g.gruvbox_transparent_bg = 1
    vim.cmd.colorscheme("gruvbox")
    set_transparent()
  end,
  ["gruvbox-material-dark"] = function()
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_transparent_background = 1
    vim.cmd.colorscheme("gruvbox-material")
  end,
  ["nord"] = function()
    vim.cmd.colorscheme("nord")
    set_transparent()
  end,
  ["oceanic-next"] = function()
    vim.cmd.colorscheme("OceanicNext")
    set_transparent()
  end,
  ["one-dark"] = function()
    require("onedarkpro").setup({ options = { transparency = true } })
    vim.cmd.colorscheme("onedark_vivid")
  end,
  ["rose-pine"] = function()
    require("rose-pine").setup({ disable_background = true })
    vim.cmd.colorscheme("rose-pine")
  end,
  ["rose-pine-moon"] = function()
    require("rose-pine").setup({ disable_background = true })
    vim.cmd.colorscheme("rose-pine-moon")
  end,
  ["tokyo-night"] = function()
    require("tokyonight").setup({ transparent = true })
    vim.cmd.colorscheme("tokyonight")
  end,
  ["tokyo-night-storm"] = function()
    require("tokyonight").setup({ style = "storm", transparent = true })
    vim.cmd.colorscheme("tokyonight-storm")
  end,
}

function M.apply_theme(theme)
  local loader = theme_map[theme]
  if loader then
    loader()
  else
    error("Theme not found: " .. theme)
  end
end

-- Auto-load on startup
local theme_path = os.getenv("HOME") .. "/.config/theme-current"
local f = io.open(theme_path, "r")
if f then
  local t = f:read("*l")
  f:close()
  pcall(M.apply_theme, t)
end

return M

