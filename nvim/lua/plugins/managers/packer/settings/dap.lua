--dap ui
require('dapui').setup()

--dap virtual text
require('nvim-dap-virtual-text').setup()

--nvim-dap
local dap, dapui = require('dap'), require('dapui')

--adapters
dap.adapters.php = {
        type = 'executable',
        command = 'node',
        args = { os.getenv('HOME') .. '/build/vscode-php-debug/out/phpDebug.js' }
}

--configurations
dap.configurations.php = {
        {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = 9000,
                pathMappings = {
                        ['/var/www/laravel'] = '${workspaceFolder}'
                }
        }
}

--listeners
dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
end

--dap.adapters.chrome = {
--type = "executable",
--command = "node",
--args = {vim.fn.stdpath("data") .. "/dapinstall/chrome/vscode-chrome-debug/out/src/chromeDebug.js"}
--}

--dap.configurations.javascript = {
--{
--type = "chrome",
--request = "attach",
--program = "${file}",
--cwd = vim.fn.getcwd(),
--sourceMaps = true,
--protocol = "inspector",
--port = 9222,
--webRoot = "${workspaceFolder}"
--}
--}

--dap.configurations.typescript = {
--{
--type = "chrome",
--request = "attach",
--program = "${file}",
--cwd = vim.fn.getcwd(),
--sourceMaps = true,
--protocol = "inspector",
--port = 9222,
--webRoot = "${workspaceFolder}"
--}
--}

--dap.configurations.javascriptreact = {
--{
--type = "chrome",
--request = "attach",
--program = "${file}",
--cwd = vim.fn.getcwd(),
--sourceMaps = true,
--protocol = "inspector",
--port = 9222,
--webRoot = "${workspaceFolder}"
--}
--}

--dap.configurations.typescriptreact = {
--{
--type = "chrome",
--request = "attach",
--program = "${file}",
--cwd = vim.fn.getcwd(),
--sourceMaps = true,
--protocol = "inspector",
--port = 9222,
--webRoot = "${workspaceFolder}"
--}
--}
