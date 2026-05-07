-- Go development. gopls LSP provides type checking and autocomplete (see plugins/coding/lsp.lua).
-- gofumpt formats on save (stricter than gofmt).

return {
  -- Go struct tag management.
  -- In visual mode: <leader>Ta adds tags, <leader>Tr removes them.
  'romus204/go-tagger.nvim',
  config = function()
    require('go-tagger').setup {
      skip_private = true, -- Skips unexported (lowercase) fields
    }

    vim.keymap.set('v', '<leader>Ta', ':AddGoTags<CR>', {
      desc = 'Add Go struct tags',
      silent = true,
    })
    vim.keymap.set('v', '<leader>Tr', ':RemoveGoTags<CR>', {
      desc = 'Remove Go struct tags',
      silent = true,
    })
  end,
}
