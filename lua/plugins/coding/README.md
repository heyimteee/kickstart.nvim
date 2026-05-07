# Coding Plugins

LSP, autocompletion, formatting, and linting.

## Active Plugins

| File | Plugin | Purpose |
|------|--------|---------|
| `lsp.lua` | nvim-lspconfig + Mason | Language servers (ts, eslint, tailwind, lua) + auto-install |
| `completion.lua` | blink.cmp | Autocompletion with LuaSnip snippets |
| `formatting.lua` | conform.nvim | Autoformat on save (`<leader>f` to format manually) |
| `linting.lua` | nvim-lint | **DISABLED** — Markdown linting, enable when needed |

## Adding a Coding Plugin

```lua
-- lua/plugins/coding/my-plugin.lua

return {
  'author/repo',
  event = 'BufReadPre',
  opts = {},
}
```

Import in `lua/plugins/init.lua`:

```lua
  require 'plugins.coding.my-plugin',
```

## Adding an LSP Server

Edit `lua/plugins/coding/lsp.lua` and add an entry to the `servers` table:

```lua
local servers = {
  -- ... existing servers ...
  pyright = {
    settings = {
      python = {
        analysis = { typeCheckingMode = 'basic' },
      },
    },
  },
}
```

Mason will auto-install it on next launch. See [lspconfig server docs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) for available options.
