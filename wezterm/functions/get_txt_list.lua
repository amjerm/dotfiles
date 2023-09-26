local get = function(file_path)
  local list = {}

  -- Open the file for reading
  local file = io.open(file_path, "r")

  -- Check if the file was successfully opened
  if file then
    for line in file:lines() do
      if not line:match("^%s*#") then
        local value = line:match("^%s*(.-)%s*$")
        if value then
          table.insert(list, value)
        end
      end
    end

    file:close()
  end
  return list
end

return {
  get = get
}
