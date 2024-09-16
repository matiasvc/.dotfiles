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


-- Copy the current file path, line number(s), and selected text to the clipboard.
vim.api.nvim_create_user_command("CopyCurrentPathAndLinesWithContent", function (opts)
  local path = vim.fn.expand("%:.")
  local result
  local selected_text

  if opts.range == 2 then
    local line_start = opts.line1
    local line_end = opts.line2
    result = "`" .. path .. ":" .. line_start .. "-" .. line_end .. "`"
    selected_text = table.concat(vim.fn.getline(line_start, line_end), "\n")
  else
    local line_number = vim.fn.line(".")
    result = "`" .. path .. ":" .. line_number .. "`"
    selected_text = vim.fn.getline(line_number)
  end

  -- Format with triple backticks around the selected text
  result = result .. "\n```" .. "\n" .. selected_text .. "\n```"

  vim.fn.setreg("+", result)
  vim.notify("Copied path with line numbers and text to clipboard:\n" .. result)
end, { range = true })
