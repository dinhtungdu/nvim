local Util = require("lazyvim.util")

local function is_git_repo()
  vim.fn.system("git rev-parse --is-inside-work-tree")

  return vim.v.shell_error == 0
end

local function get_git_root()
  local dot_git_path = vim.fn.finddir(".git", ".;")
  return vim.fn.fnamemodify(dot_git_path, ":h")
end

local opts = {}

if is_git_repo() then
  opts = {
    cwd = get_git_root(),
  }
end

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- git
      { "<leader>gc", Util.telescope("git_commits", opts), desc = "Git commits" },
      { "<leader>gs", Util.telescope("git_status", opts), desc = "Git status" },
    },
    opts = {
      defaults = {
        path_display = { "truncate" },
      },
    },
  },
}
