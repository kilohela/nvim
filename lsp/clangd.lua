return {
    cmd = { 'clangd', '--background-index' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_markers = { '.git', 'compile_commands.json', 'compile_flags.txt' },
}