local keys = require("keys")
local theme = require("theme/index").config
local merge = require("functions/merge_tables").merge

local config = {
	leader = { key = "w", mods = "ALT", timeout_milliseconds = 1000 },
	keys = keys,
	-- enable_debug_key_events = true,
	-- debug_key_events = true,
	-- log_level = "DEBUG",
}

-- add theme settings
config = merge(config, theme)

return config
