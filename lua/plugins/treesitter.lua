vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
})

vim.cmd.packadd('nvim-treesitter')
require('nvim-treesitter').install({
    'bash',
    'fish',

    'c',
    'cpp',
    'cmake',
    'make',

    'rust',
    'go',
    'zig',

    'lua',
    'python',

    'json',
    'yaml',
    'toml',

    'systemverilog',
})
