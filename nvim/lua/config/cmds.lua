-- Custom commands

vim.api.nvim_create_user_command("CopyCurrentPath", function ()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied path to clipboard: " .. path)
end, {})
