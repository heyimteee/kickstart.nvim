-- Ayu colorscheme — alternative to TokyoNight.
-- To switch: disable TokyoNight by commenting out require in plugins/ui/colorscheme.lua
-- or in plugins/init.lua, then enable this plugin.
--
-- Usage:
--   1. This file returns the Ayu spec ready to use
--   2. Uncomment the require in plugins/init.lua
--   3. Comment out the TokyoNight require in plugins/init.lua
--
-- Ayu variants: 'ayu-dark' (default), 'ayu-mirage', 'ayu-light'
-- Change the variant below.

return {
  'Shatur/neovim-ayu',
  priority = 1000,
  config = function()
    require('ayu').setup {
      mirage = false, -- false = 'ayu-dark', true = 'ayu-mirage'
      overrides = {},
    }

    vim.cmd.colorscheme 'ayu-dark'
  end,
}
