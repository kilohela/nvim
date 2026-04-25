local M = {}

vim.api.nvim_set_hl(0, 'FloatTermNormal', { bg = '#2a2a2a' })
vim.api.nvim_set_hl(0, 'FloatTermBorder', { bg = '#2a2a2a', fg = '#666666' })

function M.warn_unsaved()
    if vim.bo.modified then
        vim.notify('Warning: unsaved changes in current buffer', vim.log.levels.WARN)
    end
end

function M.float_term(cmd)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2),
        style = 'minimal',
        border = 'rounded',
    })
    vim.wo.winhighlight = 'Normal:FloatTermNormal,FloatBorder:FloatTermBorder'
    vim.cmd.terminal(cmd)
    vim.cmd.startinsert()
end

return M
