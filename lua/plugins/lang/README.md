# Language-Specific Plugins

Per-language tooling and integrations.

## Active Plugins

| File | Plugin | Purpose |
|------|--------|---------|
| `dart.lua` | flutter-tools.nvim | Flutter device management, hot reload, LSP |
| `go.lua` | go-tagger.nvim | Add/remove Go struct tags (`<leader>T`) |
| `lua.lua` | lazydev.nvim | Neovim API completions for Lua config files |
| `markdown.lua` | render-markdown.nvim | Inline Markdown rendering |
| `typescript.lua` | (reserved) | TSX highlight tuning is in `colorscheme.lua` |

## Adding a Language Plugin

```lua
-- lua/plugins/lang/my-language.lua

return {
  'author/language-tool.nvim',
  ft = 'python',            -- Only loads for Python files
  opts = {},
}
```

Import in `lua/plugins/init.lua`:

```lua
  require 'plugins.lang.my-language',
```

> **Tip:** Use `ft` (filetype) to lazy-load plugins only when you open files of that language.
