return {
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      -- 1. Initialize Flutter Tools
      require('flutter-tools').setup {
        ui = {
          border = 'rounded',
          notification_style = 'plugin', -- Uses dressing.nvim for clean popups
        },
        decorations = {
          statusline = {
            device = true,
            app_version = true,
          },
        },
        lsp = {
          color = {
            enabled = true,
            background = false,
            background_color = nil,
            foreground = false,
            virtual_text = true,
            virtual_text_str = '■',
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = 'always',
            updateImportsOnRename = true,
            hot_reload_on_save = true,
            hot_restart_on_save = false,
          },
        },
      }

      local map = vim.keymap.set
      map('n', '<leader>Fc', '<cmd>Telescope flutter commands<cr>', { desc = 'Flutter: Commands' })
      map('n', '<leader>Fd', '<cmd>FlutterDevices<cr>', { desc = 'Flutter: Devices' })
      map('n', '<leader>FD', '<cmd>FlutterDevTools<cr>', { desc = 'Flutter: Dev Tools' })
      map('n', '<leader>Fe', '<cmd>FlutterEmulators<cr>', { desc = 'Flutter: Emulators' })
      map('n', '<leader>Fl', '<cmd>FlutterLspRestart<cr>', { desc = 'Flutter: LSP Restart' })
      map('n', '<leader>FL', '<cmd>FlutterToggleLog<cr>', { desc = 'Flutter: Toggle Log' })
      map('n', '<leader>Fn', '<cmd>FlutterRename<cr>', { desc = 'Flutter: Rename' })
      map('n', '<leader>Fr', '<cmd>FlutterReload<cr>', { desc = 'Flutter: Hot Reload' })
      map('n', '<leader>FR', '<cmd>FlutterRestart<cr>', { desc = 'Flutter: Hot Restart' })
      map('n', '<leader>Fs', '<cmd>FlutterSuper<cr>', { desc = 'Flutter: Super Class' })
      map('n', '<leader>Fq', '<cmd>FlutterQuit<cr>', { desc = 'Flutter: Quit' })
      map('n', '<leader>Fx', '<cmd>FlutterRun<cr>', { desc = 'Flutter: Execute' })
    end,
  },
}
