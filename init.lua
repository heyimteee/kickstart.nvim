-- ============================================================================
-- Personal Neovim configuration — modular, maintainable, one file per concern.
-- See ARCHITECTURE.md for the full directory map and design decisions.
-- ============================================================================

-- 1. Bootstrap lazy.nvim (clones it if not already installed)
require 'config.lazy'

-- 2. Load core configuration: editor options, global keymaps, autocommands
require 'config'

-- 3. Install and configure all plugins (see lua/plugins/init.lua for the list)
require('lazy').setup(require 'plugins', {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
