-- All vim.o, vim.opt, and vim.g settings.
-- Must run before plugins load (leader keys especially).

-- [[ Leader Keys ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ UI / Appearance ]]
vim.g.have_nerd_font = true -- Set false if terminal lacks a Nerd Font

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.showmode = false -- Mode is shown in the statusline
vim.o.cursorline = true
vim.o.scrolloff = 30 -- Keep 30 lines of context above/below cursor
vim.o.splitright = true -- New vertical splits open to the right
vim.o.splitbelow = true -- New horizontal splits open below

-- [[ Behaviour ]]
vim.o.mouse = 'a' -- Enable mouse in all modes
vim.o.confirm = true -- Confirm before quitting unsaved buffers
vim.o.undofile = true -- Persistent undo history
vim.o.breakindent = true -- Wrap-indented lines keep their indent
vim.o.inccommand = 'split' -- Live preview of :substitute
vim.o.updatetime = 250 -- Lower swap-write delay & CursorHold trigger
vim.o.timeoutlen = 300 -- Shorter mapped-sequence wait

-- Clipboard: sync with system clipboard (scheduled to avoid startup delay)
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- [[ Search ]]
vim.o.ignorecase = true
vim.o.smartcase = true -- Case-sensitive when uppercase is used

-- [[ Indentation ]]
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- Spaces over tabs

-- [[ Whitespace visibility ]]
vim.o.list = true
vim.opt.listchars = { tab = '| ', trail = '·', nbsp = '␣' }

-- [[ LazyGit Window ]]
vim.g.lazygit_floating_window_scaling_factor = 0.9
vim.g.lazygit_floating_window_winblend = 30
vim.g.lazygit_use_neovim_remote = 1
vim.g.lazygit_floating_window_border_chars = { '', '', '', '', '', '', '', '' }
