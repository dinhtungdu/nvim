local M = {}

function M.get_git_root()
  local dot_git_path = vim.fn.finddir(".git", ".;")
  return vim.fn.fnamemodify(dot_git_path, ":h")
end

function M.toggle_terminal_buffer()
  if vim.bo.buftype == "terminal" then
    vim.cmd(":b#")
    return
  end

  for _, buffer in ipairs(vim.split(vim.fn.execute ":buffers! t", "\n")) do
    local match = tonumber(string.match(buffer, "%s*(%d+)"))
    local is_term = string.match(buffer, "term://")

    if is_term then
      vim.cmd(string.format(":b %s", match))
      vim.cmd(":startinsert")
      return
    end
  end

  -- if there isn't any terminal buffer opened, create one
  vim.cmd(string.format("cd %s", M.get_git_root()))
  vim.cmd("terminal")
  vim.cmd("startinsert")
end

M.icons = {
  dap = {
    Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
    Breakpoint = " ",
    BreakpointCondition = " ",
    BreakpointRejected = { " ", "DiagnosticError" },
    LogPoint = ".>",
  },
  diagnostics = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  },
  git = {
    added = " ",
    modified = " ",
    removed = " ",
  },
  kinds = {
    Array = " ",
    Boolean = " ",
    Class = " ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Copilot = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = " ",
    Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
  },
}

return M

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et:
