vim.pack.add({ 
  'https://github.com/saghen/blink.lib', 
  'https://github.com/saghen/blink.cmp' 
})

vim.cmd.packadd('blink.cmp')
local cmp = require('blink.cmp')
cmp.build():pwait()

cmp.setup({
  keymap = { preset = 'default' },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})
