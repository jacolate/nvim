return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      enabled = false,
    },
    views = {
      cmdline_popup = {
        enabled = false,
      },
    },
    routes = {
      -- Prevent Noice from hiding regular messages or commandline
      {
        filter = {
          event = "cmdline",
        },
        opts = { skip = true },
      },
    },
  },
}
