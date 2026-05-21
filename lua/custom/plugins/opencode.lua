return {
  "sudo-tee/opencode.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
  },
  event = "VeryLazy",
  config = function()
    local hl = vim.api.nvim_set_hl
    hl(0, "OpencodeBackground", { bg = "none" })
    hl(0, "OpencodeBorder", { fg = "#d79921", bg = "none" })
    hl(0, "OpencodeTitle", { fg = "#fabd2f", bold = true })

    require("opencode").setup({
      default_global_keymaps = false,
      keymap_prefix = "<leader>o",
      ui = {
        position = "right",
        input_position = "bottom",
        window_width = 0.4,
        window_highlight = "Normal:OpencodeBackground,NormalFloat:OpencodeBackground,FloatBorder:OpencodeBorder,SignColumn:OpencodeBackground,EndOfBuffer:OpencodeBackground",
        icons = {
          preset = "text",
        },
      },
      keymap = {
        editor = {
          ["<leader>og"] = { "toggle" },
          ["<leader>oi"] = { "open_input" },
          ["<leader>oI"] = { "open_input_new_session" },
          ["<leader>oo"] = { "open_output" },
          ["<leader>ot"] = { "toggle_focus" },
          ["<leader>oT"] = { "timeline" },
          ["<leader>oq"] = { "close" },
          ["<leader>os"] = { "select_session" },
          ["<leader>oR"] = { "rename_session" },
          ["<leader>op"] = { "configure_provider" },
          ["<leader>oV"] = { "configure_variant" },
          ["<leader>oy"] = { "add_visual_selection", mode = { "v" } },
          ["<leader>oY"] = { "add_visual_selection_inline", mode = { "v" } },
          ["<leader>oz"] = { "toggle_zoom" },
          ["<leader>ov"] = { "paste_image" },
          ["<leader>od"] = { "diff_open" },
          ["<leader>o]"] = { "diff_next" },
          ["<leader>o["] = { "diff_prev" },
          ["<leader>oc"] = { "diff_close" },
          ["<leader>ora"] = { "diff_revert_all_last_prompt" },
          ["<leader>ort"] = { "diff_revert_this_last_prompt" },
          ["<leader>orA"] = { "diff_revert_all" },
          ["<leader>orT"] = { "diff_revert_this" },
          ["<leader>orr"] = { "diff_restore_snapshot_file" },
          ["<leader>orR"] = { "diff_restore_snapshot_all" },
          ["<leader>ox"] = { "swap_position" },
          ["<leader>ott"] = { "toggle_tool_output" },
          ["<leader>otr"] = { "toggle_reasoning_output" },
          ["<leader>o/"] = { "quick_chat", mode = { "n", "x" } },
        },
      },
    })

    -- Enable automatic reloading of files changed by OpenCode in the background
    vim.o.autoread = true

    -- Gracefully register "<leader>o" as "[O]pencode AI" in kickstart's bottom which-key menu
    local ok, wk = pcall(require, "which-key")
    if ok then
      if wk.add then
        wk.add({ { "<leader>o", group = "[O]pencode AI" } })
      else
        wk.register({ ["<leader>o"] = { name = "[O]pencode AI" } })
      end
    end
  end,
  keys = {
    { "<leader>ot", "<cmd>Opencode toggle_focus<CR>", desc = "Toggle Focus" },
    { "<leader>os", "<cmd>Opencode session select<CR>", desc = "Select Session" },
    { "<leader>oI", "<cmd>Opencode open input_new_session<CR>", desc = "New Session" },
    { "<leader>oR", "<cmd>Opencode session rename<CR>", desc = "Rename Session" },
    { "<leader>oq", "<cmd>Opencode close<CR>", desc = "Close UI" },
  },
}
