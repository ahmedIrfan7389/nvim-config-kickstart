return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      char = '│', -- The character to use for the line
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
  },
}
