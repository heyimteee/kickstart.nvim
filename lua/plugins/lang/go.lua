-- Go struct tag management.
-- In visual mode: <leader>Ta to add tags, <leader>Tr to remove them.

return {
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
