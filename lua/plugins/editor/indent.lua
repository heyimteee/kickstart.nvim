-- Indentation helpers: auto-detection + visible indent guides.

return {
  -- Auto-detect tabstop and shiftwidth from file content
  'NMAC427/guess-indent.nvim',

  -- Visible indentation guides on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
}
