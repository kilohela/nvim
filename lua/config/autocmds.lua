vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp', 'cmake', 'rust', 'go', 'zig', 'lua', 'python', 'bash', 'fish', 'json', 'yaml', 'toml', 'verilog', 'systemverilog', 'make' },
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
