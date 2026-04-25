local utils = require('utils')

local function cargo_root()
    return vim.fs.root(0, { 'Cargo.toml' })
end

vim.api.nvim_buf_create_user_command(0, 'Run', function(opts)
    utils.warn_unsaved()
    local root = cargo_root()
    local args = opts.args ~= '' and (' -- ' .. opts.args) or ''
    if root then
        utils.float_term('cd ' .. root .. ' && cargo run' .. args)
    else
        local file = vim.fn.expand('%')
        local out = vim.fn.expand('%:r')
        utils.float_term('rustc ' .. file .. ' -o ' .. out .. ' && ./' .. out)
    end
end, { nargs = '?' })

vim.api.nvim_buf_create_user_command(0, 'Build', function()
    utils.warn_unsaved()
    local root = cargo_root()
    if root then
        utils.float_term('cd ' .. root .. ' && cargo build')
    else
        local file = vim.fn.expand('%')
        local out = vim.fn.expand('%:r')
        utils.float_term('rustc ' .. file .. ' -o ' .. out)
    end
end, {})

vim.api.nvim_buf_create_user_command(0, 'Check', function()
    utils.warn_unsaved()
    local root = cargo_root()
    if root then
        utils.float_term('cd ' .. root .. ' && cargo check')
    end
end, {})
