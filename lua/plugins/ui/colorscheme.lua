-- TokyoNight colorscheme with transparency and TSX/React highlight tuning.

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
    vim.g.semantic_tokens = true

    -- Force TSX/React to use Tokyonight's preferred syntax groups.
    -- Without this, TSX components inherit generic highlight groups that look off.
    local highlights = {
      -- Standard HTML tags (div, h1, a, etc.)
      ['@tag.builtin.tsx'] = { link = 'Tag' },
      ['tsxIntrinsicTagName'] = { link = 'Tag' },

      -- React components (<MyComponent />)
      ['@tag.tsx'] = { link = 'Function' },
      ['tsxTagName'] = { link = 'Function' },

      -- HTML/JSX attributes (className, onClick, etc.)
      ['@tag.attribute.tsx'] = { link = 'Label' },

      -- Angle brackets, slashes, curly braces
      ['@tag.delimiter.tsx'] = { link = 'Delimiter' },
      ['@punctuation.bracket'] = { link = 'Delimiter' },
    }

    for group, opts in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, opts)
    end
  end,
}
