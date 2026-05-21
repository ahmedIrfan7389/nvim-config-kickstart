return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  config = function()
    vim.cmd("let test#strategy = 'vimux'")
    local map = vim.keymap.set
    map('n', '<leader>rtn', ':TestNearest<CR>', { desc = 'Test nearest' })
    map('n', '<leader>rtf', ':TestFile<CR>', { desc = 'Test file' })
    map('n', '<leader>rts', ':TestSuite<CR>', { desc = 'Test suite' })
    map('n', '<leader>rtl', ':TestLast<CR>', { desc = 'Test last' })
  end,
}
