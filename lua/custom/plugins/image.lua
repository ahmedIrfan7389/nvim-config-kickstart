return {
  '3rd/image.nvim',
  build = false,              -- This prevents it from trying to build the rock manually
  opts = {
    processor = 'magick_cli', -- This tells it to use your Arch system's 'convert' command
    backend = 'kitty',
    integrations = {
      markdown = { enabled = true },
    },
    max_width = 100,
    max_height = 12,
  },
}
