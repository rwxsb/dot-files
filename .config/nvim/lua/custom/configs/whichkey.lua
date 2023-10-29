local wk = require('which-key')

vim.o.timeout = true
vim.o.timeoutlen = 300

wk.register({
  ["<leader>"] = {
    f = {
      name = 'file'
    }
  }
})
