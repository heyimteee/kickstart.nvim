return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree toggle<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    sync_root_with_cwd = true, -- Updates tree root when you :cd in Neovim
    respect_buf_cwd = true, -- Keeps the tree in sync with the current buffer's path
    filesystem = {
      bind_to_cwd = true, -- Always show the CWD as the tree root
      follow_current_file = {
        enabled = true, -- This "reveals" the file in the tree automatically
        leave_dirs_open = false, -- Closes other folders to keep your sidebar clean
      },
      use_libuv_file_watcher = true, -- Auto-refresh when files change on disk
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['H'] = 'toggle_hidden',
          ['.'] = 'set_root', -- Added: Press '.' to manually set tree root to current folder
        },
      },
    },
  },
}
