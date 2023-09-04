-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local function get_git_root()
  local dot_git_path = vim.fn.finddir(".git", ".;")
  return vim.fn.fnamemodify(dot_git_path, ":h")
end

-- lazygit
map("n", "<leader>gg", function()
  Util.float_term({ "lazygit" }, {
    cwd = get_git_root(),
    esc_esc = false,
    ctrl_hjkl = false,
  })
end, { desc = "Lazygit (cgwd)" })

local lazyterm = function()
  Util.float_term(nil, { cwd = get_git_root() })
end
map("n", "<leader>ft", lazyterm, { desc = "Terminal (cgwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (cgwd)" })
