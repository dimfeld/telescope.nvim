--[[ =============================================================================

Get metadata from entries.

This file is still WIP, so expect some changes if you're trying to consume these APIs.

This will provide standard mechanism for accessing information from an entry.

--============================================================================= ]]

local from_entry = {}

function from_entry.path(entry, validate, escape)
  if not (type(escape) == "boolean") then
    escape = true
  end

  local path
  if escape then
    path = entry.path and vim.fn.fnameescape(entry.path) or nil
  else
    path = entry.path
  end

  if path == nil then
    path = entry.filename
  end
  if path == nil then
    path = entry.value
  end
  if path == nil then
    print("Invalid entry", vim.inspect(entry))
    return
  end

  if validate and not vim.fn.filereadable(path) then
    return
  end

  return path
end

return from_entry
