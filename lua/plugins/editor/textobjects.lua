-- Enhanced text-objects for "around" and "inside" motions.
-- Examples: va)  — visually select around parens
--           ci'  — change inside quotes
--           yinq — yank inside next quote

return {
  'echasnovski/mini.ai',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
  end,
}
