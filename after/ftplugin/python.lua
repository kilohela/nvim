local utils = require('utils')

vim.api.nvim_buf_create_user_command(0, 'Run', function(opts)
    utils.warn_unsaved()
    local file = vim.fn.expand('%')
    local args = opts.args ~= '' and (' ' .. opts.args) or ''
    utils.float_term('python3 ' .. file .. args)
end, { nargs = '?' })
