math.randomseed(os.time())

local pick = function(pool)
	return pool[math.random(#pool)]
end

return {
	pick = pick,
}
