return {
  {
    'olimorris/codecompanion.nvim', -- The KING of AI programming
    cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionActions' },
    dependencies = {
      'j-hui/fidget.nvim', -- Display status
      'ravitemer/codecompanion-history.nvim', -- Save and load conversation history
      {
        'ravitemer/mcphub.nvim', -- Manage MCP servers
        cmd = 'MCPHub',
        build = 'npm install -g mcp-hub@latest',
        config = true,
      },
      {
        'Davidyz/VectorCode',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = 'VectorCode', -- if you're lazy-loading VectorCode
      },
      {
        'HakonHarnes/img-clip.nvim', -- Share images with the chat buffer
        event = 'VeryLazy',
        cmd = 'PasteImage',
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = '[Image]($FILE_PATH)',
              use_absolute_path = true,
            },
          },
        },
      },
      -- { "echasnovski/mini.pick", config = true },
      -- { "ibhagwan/fzf-lua", config = true },
    },
    opts = {
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = 'gh',
            save_chat_keymap = 'sc',
            auto_save = false,
            auto_generate_title = false,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            picker = 'snacks',
            enable_logging = false,
            dir_to_save = vim.fn.stdpath 'data' .. '/codecompanion-history',
          },
        },
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
        vectorcode = {
          opts = {
            add_tool = true,
          },
        },
      },
      adapters = {
        openai = function()
          return require('codecompanion.adapters').extend('openai', {
            opts = {
              stream = true,
            },
            env = {
              api_key = 'cmd:op read op://personal/OpenAI_API/credential --no-newline',
            },
            schema = {
              model = {
                default = function()
                  return 'gpt-4.1'
                end,
              },
            },
          })
        end,
      },
    },
  },
}
