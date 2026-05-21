local copilot_suggestions_enabled

local function set_copilot_suggestions(enabled)
  local suggestion = require("copilot.suggestion")
  local config = require("copilot.config")

  if enabled then
    config.suggestion.enabled = true
    suggestion.setup()
  else
    suggestion.teardown()
    suggestion.clear_preview()
    config.suggestion.enabled = false
  end

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) then
      if enabled then
        suggestion.set_keymap(bufnr)
      else
        suggestion.unset_keymap(bufnr)
      end
    end
  end
end

local function toggle_copilot_suggestions()
  copilot_suggestions_enabled = not copilot_suggestions_enabled
  set_copilot_suggestions(copilot_suggestions_enabled)
  vim.notify('Copilot inline suggestions ' .. (copilot_suggestions_enabled and 'enabled' or 'disabled'))
end

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        -- Enable inline suggestions
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            -- You can change the accept key to whatever you prefer (e.g., <Tab>, <Right>, etc.)
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = {
          enabled = false,
        },
      })
      if copilot_suggestions_enabled == nil then
        copilot_suggestions_enabled = require("copilot.config").suggestion.enabled
      end
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      -- See CopilotChat.nvim documentation for more options
      debug = false,
      window = {
        layout = 'float', -- 'vertical', 'horizontal', 'float', 'replace'
      },
      mappings = {
        complete = {
          detail = 'Use @<Tab> or /<Tab> for options.',
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>',
        },
        reset = {
          normal = '<C-l>',
          insert = '<C-l>',
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-s>',
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
        show_diff = {
          normal = 'gd',
        },
        show_info = {
          normal = 'gp',
        },
        show_context = {
          normal = 'gc',
        },
        show_help = {
          normal = 'gh',
        },
      },
    },
    keys = {
      {
        "<leader>cc",
        function()
          local chat = require("CopilotChat")
          local select = require("CopilotChat.select")
          -- Properly pass a function that gets visual selection or the whole buffer
          chat.toggle({
            selection = function(source)
              return select.visual(source) or select.buffer(source)
            end,
          })
        end,
        desc = "Toggle Copilot Chat Window",
        mode = { "n", "v" },
      },
      {
        "<leader>ca",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Ask Copilot Chat",
        mode = { "n", "v" },
      },
      {
        "<leader>cx",
        function()
          require("CopilotChat").reset()
        end,
        desc = "Clear/Reset Copilot Chat",
        mode = { "n", "v" },
      },
      -- Feature shortcuts
      {
        "<leader>ce",
        "<cmd>CopilotChatExplain<cr>",
        desc = "Copilot Chat - Explain code",
        mode = { "n", "v" },
      },
      {
        "<leader>ct",
        "<cmd>CopilotChatTests<cr>",
        desc = "Copilot Chat - Generate tests",
        mode = { "n", "v" },
      },
      {
        "<leader>cf",
        "<cmd>CopilotChatFix<cr>",
        desc = "Copilot Chat - Fix code",
        mode = { "n", "v" },
      },
      {
        "<leader>co",
        "<cmd>CopilotChatOptimize<cr>",
        desc = "Copilot Chat - Optimize code",
        mode = { "n", "v" },
      },
      {
        "<leader>cd",
        "<cmd>CopilotChatDocs<cr>",
        desc = "Copilot Chat - Add documentation",
        mode = { "n", "v" },
      },
      {
        "<leader>cm",
        "<cmd>CopilotChatModels<cr>",
        desc = "Copilot Chat - Select AI Model",
        mode = { "n" },
      },
      {
        "<leader>cp",
        function()
          local chat = require("CopilotChat")
          chat.ask("", {
            selection = require("CopilotChat.select").buffer,
            window = {
              layout = "float"
            }
          })
        end,
        desc = "Copilot Chat - Prompt Actions",
        mode = { "n", "v" },
      },
      {
        "<leader>cs",
        function()
          toggle_copilot_suggestions()
        end,
        desc = "Toggle Copilot suggestions",
        mode = { "n" },
      },
    },
  },
}
