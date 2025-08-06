return function()
  require("codecompanion").setup({
    opts = {
      -- log_level = "DEBUG", -- or "TRACE"
    },
    strategies = {
      chat = {
        fold_context = true,
        icons = {
          chat_context = "📎️", -- You can also apply an icon to the fold
        },

        opts = {
          completion_provider = "cmp", -- blink|cmp|coc|default
        },
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4",
        },
      },
      inline = {
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4",
        }
      },
      agent = {
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4",
        }
      },
    },
    display = {
      action_palette = {
        opts = {
          show_default_actions = true, -- Show the default actions in the action palette?
          show_default_prompt_library = true, -- Show the default prompt library in the action palette?
        },
      },
      -- show diff created by the `insert_edit_into_file` tool
      diff = {
        enabled = true,
        -- close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
        layout = "vertical", -- vertical|horizontal split for default provider
        opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = "default", -- default|mini_diff
      },
      chat = {
        -- Options to customize the UI of the chat buffer
        window = {
          layout = "vertical", -- float|vertical|horizontal|buffer
          position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
          border = "single",
          height = 0.8,
          width = 0.45,
          relative = "editor",
          full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
          sticky = false, -- when set to true and `layout` is not `"buffer"`, the chat buffer will remain opened when switching tabs
          opts = {
            breakindent = true,
            cursorcolumn = false,
            cursorline = false,
            foldcolumn = "0",
            linebreak = true,
            list = false,
            numberwidth = 1,
            signcolumn = "no",
            spell = false,
            wrap = true,
          },
        },
        show_token_count = true, -- Show the token count for each response?
        show_settings = false, -- Show LLM settings at the top of the chat buffer?


        ---Customize how tokens are displayed
        ---@param tokens number
        ---@param adapter CodeCompanion.Adapter
        ---@return string
        token_count = function(tokens, adapter)
          return " (" .. tokens .. " tokens)"
        end,
      },
    },
  })
end
