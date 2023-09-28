hs.hotkey.bind({ 'cmd', 'alt', 'ctrl' }, 'W', function()
        hs.alert.show('Hello World!')
end)

local appBindings = {
        { 'W', 'firefox developer edition' }, -- web browser
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

-- hide frontmost app
hs.hotkey.bind({ 'cmd', 'ctrl' }, 'X', function()
        hs.application.frontmostApplication():hide()
end)

-- hide all apps
hs.hotkey.bind({ 'cmd', 'ctrl' }, 'A', function()
        hideAll(true)
end)

-- hide all except frontmost app
hs.hotkey.bind({ 'cmd', 'ctrl' }, 'B', function()
        hideAll(true)
end)

hideAll = function(excludeFrontmost)
        local runningApps = hs.application.runningApplications()
        for _, v in pairs(runningApps) do
                if excludeFrontmost then
                        if v:isFrontmost() == false then
                                v:hide()
                        end
                else
                        v:hide()
                end
        end
end

toggleApp = function(name)
        local app = hs.application.get(name)
        if app == nil or app:isFrontmost() == false then
                hs.application.launchOrFocus(name)
        else
                app:hide()
        end
end
