local setup = function(default_plus)
        require('rust-tools').setup({
                server = default_plus({
                        settings = {
                                ['rust-analyzer'] = {
                                        check = {
                                                command = 'clippy'
                                        }
                                }
                        },
                })
        })
end

return {
        setup = setup
}
