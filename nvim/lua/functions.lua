-- functions
function CLScopes(...)
        local args = { ... }
        local command = "!zsh -ic \"pnpm run cl:scopes -q "

        for i, arg in ipairs(args) do
                command = command .. "'" .. vim.fn.shellescape(arg) .. "'"
                if i < #args then
                        command = command .. ","
                end
        end

        command = command .. "\""

        vim.cmd("execute '" .. command .. "'")
end
