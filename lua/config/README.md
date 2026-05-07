# Configuration Modules

Core Neovim settings — separate from plugins. These files configure the editor itself, not third-party plugins.

## Files

| File | Purpose |
|------|---------|
| `lazy.lua` | Bootstraps lazy.nvim (clones if missing, prepends to runtime path) |
| `options.lua` | All `vim.o`, `vim.opt`, and `vim.g` settings (leader key, UI, behaviour, search, indent) |
| `keymaps.lua` | Global keymaps not owned by any plugin (window nav, escape, netrw) |
| `autocmds.lua` | Global autocommands (yank highlight, auto-reload on focus) |
| `init.lua` | Requires all the above — loaded by `~/.config/nvim/init.lua` |

## How It Connects

```
init.lua  →  require('config')      (loads config/init.lua)
              ├─ config/options.lua
              ├─ config/keymaps.lua
              └─ config/autocmds.lua

init.lua  →  require('config.lazy')  (lazy.nvim bootstrap)
```

`config/lazy.lua` is required separately (before `config/init.lua`) because the lazy bootstrap must happen before any plugin code runs.

## Adding a New Config Module

1. Create a file here (e.g. `diag.lua` for diagnostic tweaks)
2. Add `require 'config.diag'` to `config/init.lua`

Keep it focused — if it belongs to a specific plugin, put it in the plugin's file under `lua/plugins/` instead.
