return {
  '3rd/image.nvim',
  build = false,
  config = function()
    local ok = pcall(function()
      require('image').setup({
        processor = 'magick_cli',
        backend = 'kitty',
        integrations = {
          markdown = { enabled = true },
        },
        max_width = 100,
        max_height = 12,
      })
    end)
    if not ok then
      vim.schedule(function()
        vim.notify('image.nvim: terminal does not support image rendering (kitty backend unavailable)', vim.log.levels.INFO)
      end)
    end
  end,
}
