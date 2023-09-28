hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
        hs.alert.show("Hello World!")
end)

local appBindings = {
        { 'B', 'firefox developer edition' },
        { 'C', 'fantastical' },
        { 'N', 'obsidian' },
        { 'P', 'firefox' },
        { 'S', 'slack' },
        { 'T', 'telegram' },
}

for _, v in pairs(appBindings) do
        hs.hotkey.bind({ "cmd", "ctrl" }, v[1], function()
                toggleApp(v[2])
        end)
end

toggleApp = function(name)
        local app = hs.application.get(name)
        if app == nil or app:isFrontmost() == false then
                hs.application.launchOrFocus(name)
        else
                app:hide()
        end
end
