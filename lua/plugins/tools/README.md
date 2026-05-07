# Tool Plugins

Utility plugins: fuzzy finder, git, AI, terminal, debugging.

## Active Plugins

| File | Plugin | Purpose |
|------|--------|---------|
| `copilot.lua` | copilot.lua | GitHub Copilot autocompletion |
| `gitsigns.lua` | gitsigns.nvim | Git gutter signs + hunk navigation/actions |
| `lazygit.lua` | lazygit.nvim | LazyGit TUI in a floating window (`<leader>gg`) |
| `telescope.lua` | telescope.nvim | Fuzzy finder for files, grep, help, buffers |
| `debug.lua` | nvim-dap + dap-ui + dap-go | **DISABLED** — step-through debugging for Go |

## Adding a Tool Plugin

```lua
-- lua/plugins/tools/my-plugin.lua

return {
  'author/repo',
  cmd = 'MyCommand',        -- Lazy-load on command
  keys = {
    { '<leader>m', '<cmd>MyCommand<cr>', desc = 'My Plugin' },
  },
  opts = {},
}
```

Import in `lua/plugins/init.lua`:

```lua
  require 'plugins.tools.my-plugin',
```
