-- install codeium
-- https://github.com/Exafunction/codeium.vim
return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    -- Disable Codeium's default Tab mapping so it doesn't mess with your indentation
    vim.g.codeium_no_map_tab = 1

    -- Use Ctrl + L to accept the suggestion
    vim.keymap.set('i', '<C-l>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })

    -- Cycle suggestions
    vim.keymap.set('i', '<c-;>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true })

    vim.keymap.set('i', '<c-,>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true })

    -- Clear suggestion
    vim.keymap.set('i', '<c-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true })
  end,
}
