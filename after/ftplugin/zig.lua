local utils = require('utils')

local function zig_root()
    return vim.fs.root(0, { 'build.zig' })
end

vim.api.nvim_buf_create_user_command(0, 'Run', function(opts)
    utils.warn_unsaved()
    local root = zig_root()
    local args = opts.args ~= '' and (' -- ' .. opts.args) or ''
    if root then
        utils.float_term('cd ' .. root .. ' && zig build run' .. args)
    else
        local file = vim.fn.expand('%')
        utils.float_term('zig run ' .. file)
    end
end, { nargs = '?' })

vim.api.nvim_buf_create_user_command(0, 'Build', function()
    utils.warn_unsaved()
    local root = zig_root()
    if root then
        utils.float_term('cd ' .. root .. ' && zig build')
    else
        local file = vim.fn.expand('%')
        utils.float_term('zig build-exe ' .. file)
    end
end, {})

vim.api.nvim_buf_create_user_command(0, 'Test', function()
    utils.warn_unsaved()
    local root = zig_root()
    if root then
        utils.float_term('cd ' .. root .. ' && zig build test')
    else
        local file = vim.fn.expand('%')
        utils.float_term('zig test ' .. file)
    end
end, {})
