return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>-",
      "<cmd>Yazi<cr>",
      desc = "Open Yazi at current file",
    },
    {
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open Yazi in nvim's working directory",
    },
    {
      "<C-Up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume last Yazi session",
    },
  },
  opts = {
    open_for_directories = false, -- don’t hijack :e for dirs
    keymaps = {
      show_help = "<F1>",
    },
  },
}

