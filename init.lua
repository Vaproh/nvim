local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("keymaps")

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = { lazy = false },
})

-- Theme loader and watcher
pcall(require, "theme_loader")
vim.defer_fn(function()
  pcall(require, "theme_watcher")
end, 1000)

