return {
  -- Linting
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    -- Define your active linters here
    lint.linters_by_ft = {
      markdown = { 'markdownlint' },
      python = { 'ruff' }, -- 'ruff' is incredibly fast for Python
      cpp = { 'cpplint' },
    }

    -- Create autocmd which carries out the actual linting
    -- on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        -- Only run the linter in buffers that you can modify
        if vim.bo.modifiable then
          lint.try_lint()
        end
      end,
    })
  end,
}
