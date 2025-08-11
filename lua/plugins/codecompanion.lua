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
        tools = {
          opts = {
            folds = {
              enabled = false,  -- expand tool output by default
            }
          },
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
        show_settings = false, -- Show LLM settings at the top of the chat buffer?

        show_token_count = true, -- Show the token count for each response?
        ---Customize how tokens are displayed
        ---@param tokens number
        ---@param adapter CodeCompanion.Adapter
        ---@return string
        token_count = function(tokens, adapter)
          return " (" .. tokens .. " tokens)"
        end,
      },
    },
    prompt_library = {
      ["Fix clippy errors"] = {
        strategy = "workflow",
        description = "Use a workflow to fix all clippy errors",
        opts = {
          is_default = false,
          short_name = "clippy",
        },
        prompts = {
          {
            {
              name = "Setup Test",
              role = "user",
              opts = { auto_submit = false },
              content = function()
                -- Enable turbo mode!!!
                vim.g.codecompanion_auto_tool_mode = true

                return [[### Instructions

Fix all clippy errors from `cargo clippy --all-targets --all-features -- -D warnings`

### Steps to Follow

You are required to write code following the instructions provided above and test the correctness by running the designated test suite. Follow these steps exactly:

1. Update all the impacted files using the @{insert_edit_into_file} tool
2. Then use the @{cmd_runner} tool to run the clippy command (do this after you have updated the code)
3. Make sure you trigger both tools in the same response

We'll repeat this cycle until the clippy command exits without error. Ensure no deviations from these steps.]]
              end,
            },
          },
        },
      },
    },
  })
end
