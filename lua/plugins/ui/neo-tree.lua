-- File-tree sidebar. Toggle with \.
-- Press \ again inside the tree to close it, H to toggle hidden files,
-- . to set the tree root to the current folder.

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false, -- Must load early to hijack netrw on startup
  keys = {
    { '\\', ':Neotree toggle<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['H'] = 'toggle_hidden',
          ['.'] = 'set_root',
        },
      },
    },
  },
}
