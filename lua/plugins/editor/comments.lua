-- Highlight TODO, FIXME, HACK, and other marker keywords in comments.

return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
