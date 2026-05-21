return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')
    
    -- Override the default alpha header highlight to red
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#E06C75" })
    -- Re-apply on colorscheme changes so it always stays red
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#E06C75" })
      end,
    })

    dashboard.section.header.val = {
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⢀⣴⠆⠀⠹⣿⣿⣿⠇⠀⠀⣶⣄⠀⠀⠀⠀⠀",
      "⠀⠀⠀⢀⣴⣿⠋⠀⠀⠀⢹⣿⣟⠀⠀⠀⠘⣿⣷⡀⠀⠀⠀",
      "⠀⢀⣴⣿⣿⠃⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠈⢿⣿⣧⡀⠀",
      "⠰⣿⣿⣿⣇⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⣨⣿⣿⣿⠆",
      "⠀⠈⠻⣿⣿⣿⣦⡀⠀⠀⢸⣿⣿⠀⠀⠀⣠⣾⣿⣿⠟⠁⠀",
      "⠀⠀⠀⠈⠻⣿⣿⣿⣦⡀⢸⣿⣿⢀⣴⣾⣿⣿⠟⠁⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠈⠛⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⣠⣼⣿⣿⣿⢿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀",
      "⠀⠀⠀⣠⣾⣿⣿⡿⠛⠁⢸⣿⡏⠀⠙⢿⣿⣿⣷⣄⠀⠀⠀",
      "⠀⢠⣾⣿⣿⡿⠋⠀⠀⠀⢸⣿⣿⠀⠀⠀⠙⢿⣿⣿⣷⣄⠀",
      "⠘⢿⣿⣿⣿⡀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⢀⣽⣿⣿⡿⠃",
      "⠀⠀⠙⢿⣿⣿⣦⡀⠀⠀⢸⣿⣿⠀⠀⢀⣴⣿⣿⡿⠋⠀⠀",
      "⠀⠀⠀⠀⠙⢿⣿⣿⣦⣄⢸⣿⣿⢀⣴⣿⣿⡿⠋⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣾⣿⣿⣿⣿⡿⠟⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢛⡿⡛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("g", "  Live Grep", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("c", "  Configure", "<cmd>edit $MYVIMRC<CR>"),
      dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    }
    alpha.setup(dashboard.opts)
  end
}
