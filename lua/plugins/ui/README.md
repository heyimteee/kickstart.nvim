# UI Plugins

Visual layer: colorscheme, statusline, file explorer, keybinding hints.

## Active Plugins

| File | Plugin | Purpose |
|------|--------|---------|
| `colorscheme.lua` | tokyonight.nvim | TokyoNight theme — default colorscheme |
| `ayu.lua` | neovim-ayu | **DISABLED** — Ayu alternative; uncomment to enable |
| `neo-tree.lua` | neo-tree.nvim | File-tree sidebar (toggle with `\`) |
| `statusline.lua` | mini.statusline | Minimal statusline with mode, file, git, position |
| `which-key.lua` | which-key.nvim | Popup showing pending keybindings |

## Adding a UI Plugin

Create a file in this directory:

```lua
-- lua/plugins/ui/my-plugin.lua

return {
  'author/repo',
  priority = 500,  -- Higher = loads earlier (colorschemes need ~1000)
  opts = {},
}
```

Then import it in `lua/plugins/init.lua` under the `[[ UI ]]` section:

```lua
  require 'plugins.ui.my-plugin',
```

> **Colorscheme note:** If you change colorschemes, edit `colorscheme.lua` and move any highlight overrides that depend on the old theme.
