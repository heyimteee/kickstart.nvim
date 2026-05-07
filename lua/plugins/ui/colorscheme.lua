-- TokyoNight colorscheme — the default theme.
-- To switch to Ayu: comment out the require below, enable ayu.lua in init.lua,
-- then uncomment require in plugins/ui/ayu.lua.
-- See plugins/ui/ayu.lua for the alternative.

return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Load before other start plugins so the colorscheme is set immediately
  config = function()
    require('tokyonight').setup {
      styles = {
        comments = { italic = false },
      },
      transparent = true,
    }

    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
