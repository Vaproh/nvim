local uv = vim.loop
local notify = require("notify")

local theme_file = os.getenv("HOME") .. "/.config/theme-current"

local function read_theme()
  local f = io.open(theme_file, "r")
  if not f then return nil end
  local t = f:read("*l")
  f:close()
  return t
end

local function apply_theme()
  local ok, theme_loader = pcall(require, "theme_loader")
  if not ok then
    notify("⚠ Failed to load theme_loader", "error", { title = "Theme Watcher" })
    return
  end

  vim.schedule(function()
    local theme = read_theme()
    if not theme then return end
    local ok2, err = pcall(theme_loader.apply_theme, theme)
    if ok2 then
      notify("🎨 Theme reloaded: " .. theme, "info", { title = "Theme Watcher" })
    else
      notify("❌ Failed to apply theme: " .. err, "error", { title = "Theme Watcher" })
    end
  end)
end

local function watch_file(path)
  local handle = uv.new_fs_event()
  if handle then
    handle:start(path, {}, function()
      handle:stop()
      apply_theme()
      vim.defer_fn(function()
        watch_file(path)
      end, 1000)
    end)
  end
end

watch_file(theme_file)

