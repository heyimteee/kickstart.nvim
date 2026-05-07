-- Popup showing available keybindings when you pause after a leader/prefix key.
-- Groups are declared here so which-key can label your custom keymap prefixes.

return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 0,
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ', Down = '<Down> ', Left = '<Left> ', Right = '<Right> ',
        C = '<C-…> ', M = '<M-…> ', D = '<D-…> ', S = '<S-…> ',
        CR = '<CR> ', Esc = '<Esc> ', ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ', NL = '<NL> ', BS = '<BS> ',
        Space = '<Space> ', Tab = '<Tab> ',
        F1 = '<F1>', F2 = '<F2>', F3 = '<F3>', F4 = '<F4>',
        F5 = '<F5>', F6 = '<F6>', F7 = '<F7>', F8 = '<F8>',
        F9 = '<F9>', F10 = '<F10>', F11 = '<F11>', F12 = '<F12>',
      },
    },
    spec = {
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>p', group = '[P]roject' },
      { '<leader>pv', desc = 'Open file explorer (netrw)' },
      { '<leader>g', group = '[G]it' },
      { '<leader>gg', desc = 'Open Lazygit' },
      { '<leader>T', group = 'Golang [T]ag', mode = { 'v' } },
      { '<leader>Ta', desc = '[T]ag [A]dd', mode = { 'v' } },
      { '<leader>Tr', desc = '[T]ag [R]emove', mode = { 'v' } },
      { '<leader>F', group = '[F]lutter', mode = { 'n' } },
      { '<leader>Fc', desc = 'Telescope Commands', mode = { 'n' } },
      { '<leader>Fd', desc = 'Devices', mode = { 'n' } },
      { '<leader>FD', desc = 'Dev Tools', mode = { 'n' } },
      { '<leader>Fe', desc = 'Emulators', mode = { 'n' } },
      { '<leader>Fl', desc = 'LSP Restart', mode = { 'n' } },
      { '<leader>FL', desc = 'Toggle Log', mode = { 'n' } },
      { '<leader>Fn', desc = 'Rename & Update', mode = { 'n' } },
      { '<leader>Fr', desc = 'Hot Reload', mode = { 'n' } },
      { '<leader>FR', desc = 'Hot Restart', mode = { 'n' } },
      { '<leader>Fs', desc = 'Go to Super Class', mode = { 'n' } },
      { '<leader>Fq', desc = 'Quit', mode = { 'n' } },
      { '<leader>Fx', desc = 'Execute', mode = { 'n' } },
    },
  },
}
