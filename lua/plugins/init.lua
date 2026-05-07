-- Plugin aggregator.
-- Every plugin file in this directory tree returns a lazy.nvim spec table.
-- This file collects them all into a single array that gets loaded by init.lua.
--
-- To add a plugin: create a file in the appropriate category, then import it below.
-- To disable a plugin: comment out its require line.

return {
  -- [[ Editor ]]
  require 'plugins.editor.indent',
  require 'plugins.editor.autopairs',
  require 'plugins.editor.comments',
  require 'plugins.editor.surround',
  require 'plugins.editor.textobjects',

  -- [[ UI ]]
  -- require 'plugins.ui.colorscheme', -- TokyoNight (default)
  require 'plugins.ui.ayu', -- Ayu (alternative — disable TokyoNight above first)
  require 'plugins.ui.highlights', -- JSX/TSX tag highlighting (Ayu only)
  require 'plugins.ui.neo-tree',
  require 'plugins.ui.statusline',
  require 'plugins.ui.which-key',

  -- [[ Coding ]]
  require 'plugins.coding.lsp',
  require 'plugins.coding.completion',
  require 'plugins.coding.formatting',
  require 'plugins.coding.linting',

  -- [[ Language-specific ]]
  require 'plugins.lang.dart',
  require 'plugins.lang.go',
  require 'plugins.lang.lua',
  require 'plugins.lang.markdown',
  require 'plugins.lang.php',
  require 'plugins.lang.typescript',
  require 'plugins.lang.vue',

  -- [[ Tools ]]
  require 'plugins.tools.copilot',
  require 'plugins.tools.gitsigns',
  require 'plugins.tools.lazygit',
  require 'plugins.tools.telescope',
  -- require 'plugins.tools.debug',          -- DISABLED: enable when you need DAP debugging

  -- [[ Treesitter ]]
  require 'plugins.treesitter',
}
