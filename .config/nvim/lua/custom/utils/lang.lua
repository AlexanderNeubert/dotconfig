local M = {}

M.matches_any_regex = function(str, tbl)
  for _, pattern in ipairs(tbl) do
    if string.match(str, pattern) then
      return true
    end
  end
  return false
end

M.list_merge = function(...)
  local lists = {}
  for _, list in ipairs { ... } do
    vim.list_extend(lists, list)
  end
  return lists
end

M.tbl_merge = function(...)
  return require("lazy.util").merge(...)
end

return M
