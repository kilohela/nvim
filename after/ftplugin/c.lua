local utils = require('utils')

local function build_cmd()
    local root = vim.fs.root(0, { 'CMakeLists.txt' })
    if root then
        return 'cmake --build ' .. root .. '/build', root .. '/build/main'
    else
        local file = vim.fn.expand('%')
        local out = vim.fn.expand('%:r')
        return 'gcc ' .. file .. ' -o ' .. out, './' .. out
    end
end

vim.api.nvim_buf_create_user_command(0, 'Run', function(opts)
    utils.warn_unsaved()
    local build, run = build_cmd()
    local args = opts.args ~= '' and (' ' .. opts.args) or ''
    utils.float_term(build .. ' && ' .. run .. args)
end, { nargs = '?' })

vim.api.nvim_buf_create_user_command(0, 'Build', function()
    utils.warn_unsaved()
    local build = build_cmd()
    utils.float_term(build)
end, {})
