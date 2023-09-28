hs.hotkey.bind({ 'cmd', 'alt', 'ctrl' }, 'W', function()
        hs.alert.show('Hello World!')
end)

local appBindings = {
        { 'B', 'firefox developer edition' }, -- browser
        { 'C', 'fantastical' },               -- calendar
        { 'D', 'datagrip' },                  -- database
        { 'M', 'slack' },                     -- messaging
        { 'N', 'obsidian' },                  -- notes
        { 'T', 'wezterm' },                   -- terminal
}

for _, v in pairs(appBindings) do
        hs.hotkey.bind({ 'cmd', 'ctrl' }, v[1], function()
                toggleApp(v[2])
        end)
end

hs.hotkey.bind({ 'cmd', 'ctrl' }, 'X', function()
        hs.application.frontmostApplication():hide()
end)

toggleApp = function(name)
        local app = hs.application.get(name)
        if app == nil or app:isFrontmost() == false then
                hs.application.launchOrFocus(name)
        else
                app:hide()
        end
end