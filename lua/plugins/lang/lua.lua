-- Provides Lua LSP completions for Neovim APIs and plugin APIs.
-- Loads only on Lua filetypes.

return {
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}
