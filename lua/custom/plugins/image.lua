return {
  '3rd/image.nvim',
  build = false,
  config = function()
    local ok = pcall(function()
      require('image').setup({
        processor = 'magick_cli',
        integrations = {
          markdown = { enabled = true },
        },
        max_width = 100,
        max_height = 12,
      })
    end)
    if not ok then
    end
  end,
}
