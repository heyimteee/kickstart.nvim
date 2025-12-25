return {
  'romus204/go-tagger.nvim',
  config = function()
    require('go-tagger').setup {
      skip_private = true,
    }

    vim.keymap.set('v', '<leader>at', ':AddGoTags<CR>', {
      desc = 'Add Go struct tags',
      silent = true,
    })

    vim.keymap.set('v', '<leader>rt', ':RemoveGoTags<CR>', {
      desc = 'Remove Go struct tags',
      silent = true,
    })
  end,
}
