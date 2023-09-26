local color_scheme_pool = require('functions/get_txt_list').get('color_schemes.txt')

math.randomseed(os.time())

local generate = function()
  local color_scheme_index = math.random(#(color_scheme_pool))
  return color_scheme_pool[color_scheme_index]
end

return {
  generate = generate
}
