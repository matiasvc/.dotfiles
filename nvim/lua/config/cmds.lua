-- Custom commands

-- Copy the current file path to the clipboard
vim.api.nvim_create_user_command("CopyCurrentPath", function ()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied path to clipboard: " .. path)
end, {})

-- Copy the current file path and line number to the clipboard. Will copy the
-- range of line numbers if a range is provided.
vim.api.nvim_create_user_command("CopyCurrentPathAndLines", function (opts)
  local path = vim.fn.expand("%:.")
  local result

  if opts.range == 2 then
    local line_start = opts.line1
    local line_end = opts.line2
    result = path .. ":" .. line_start .. "-" .. line_end
  else
    local line_number = vim.fn.line(".")
    result = path .. ":" .. line_number
  end

  vim.fn.setreg("+", result)
  vim.notify("Copied path with line numbers to clipboard: " .. result)
end, { range = true })
