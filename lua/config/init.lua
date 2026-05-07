-- Central loader for all configuration modules.
-- Each submodule below handles one concern: options, keymaps, autocommands, and
-- lazy.nvim bootstrapping. Keep it that way — one file, one responsibility.

require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
