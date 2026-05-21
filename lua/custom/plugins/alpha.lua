return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')
    
    -- Define a custom highlight group for the red logo
    vim.api.nvim_set_hl(0, "AlphaHeaderRed", { fg = "#E06C75" }) -- A nice, vibrant red

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
    
    -- Apply the red highlight to the header
    dashboard.section.header.opts.hl = "AlphaHeaderRed"

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
