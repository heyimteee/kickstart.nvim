-- Global autocommands that aren't tied to a specific plugin.

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text briefly
local yank_group = augroup('user-highlight-yank', { clear = true })
autocmd('TextYankPost', {
  desc = 'Briefly highlight yanked text',
  group = yank_group,
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Auto-reload files changed on disk (e.g. by git checkout, external editor)
vim.o.autoread = true
autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  callback = function()
    if vim.fn.getcmdwintype() == '' then
      vim.cmd 'checktime'
    end
  end,
})
