local function get_git_root()
  local dot_git_path = vim.fn.finddir(".git", ".;")
  return vim.fn.fnamemodify(dot_git_path, ":h")
end

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    keys = {
      -- git
      {
        "<leader>gc",
        function()
          require("telescope.builtin").git_commits({ cwd = get_git_root() })
        end,
        desc = "Git commits",
      },
      {
        "<leader>gs",
        function()
          require("telescope.builtin").git_status({ cwd = get_git_root() })
        end,
        desc = "Git status",
      },
    },
    opts = {
      defaults = {
        path_display = { "truncate" },
      },
    },
  },
}
