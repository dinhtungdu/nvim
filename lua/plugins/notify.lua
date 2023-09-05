return {
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>uN",
        function()
          require("telescope").extensions.notify.notify()
        end,
        desc = "Notifications history",
      },
    },
    opts = {
      stages = "static",
    },
  },
}
