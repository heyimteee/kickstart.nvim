-- GitHub Copilot inline suggestions.
-- Accept: <C-l>, next: <C-j>, previous: <C-k>, dismiss: <C-h>.

return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<C-l>',
          accept_word = false,
          accept_line = false,
          next = '<C-j>',
          prev = '<C-k>',
          dismiss = '<C-h>',
        },
      },
    },
  },
}
