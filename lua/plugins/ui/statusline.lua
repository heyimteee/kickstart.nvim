-- Minimal statusline showing mode, filename, git branch, and cursor position.
-- Overrides the default section_location to display LINE:COLUMN.

return {
  'echasnovski/mini.statusline',
  opts = {
    use_icons = vim.g.have_nerd_font,
  },
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
