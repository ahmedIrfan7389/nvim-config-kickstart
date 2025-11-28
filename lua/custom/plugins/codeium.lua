-- install codeium
-- https://github.com/Exafunction/codeium.vim
return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    -- Change '<C-g>' here to any keycode you like.
    -- Note: The image used <C-space>, but that often conflicts with nvim-cmp/blink.
    -- I recommend <C-g> (standard for Codeium) or keeping <C-space> if you disable it in cmp.

    vim.keymap.set('i', '<C-space>', function()
      -- vim.keymap.set('i', '<Tab>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })

    vim.keymap.set('i', '<c-;>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true })

    vim.keymap.set('i', '<c-,>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true })

    vim.keymap.set('i', '<c-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true })
  end,
}
