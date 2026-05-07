# Plugins

All plugin specifications live here, organized by category. Each file returns a [lazy.nvim spec](https://github.com/folke/lazy.nvim) table.

## How It Works

```
lua/plugins/init.lua          ← Aggregator — collects all plugin specs
  ├─ editor/...               ← One file per plugin
  ├─ ui/...
  ├─ coding/...
  ├─ lang/...
  ├─ tools/...
  └─ treesitter.lua
```

The aggregator (`init.lua`) requires each plugin file and builds a single array that gets passed to `lazy.setup()` in `~/.config/nvim/init.lua`.

## Adding a New Plugin

1. **Choose a category** based on what the plugin does:
   - `editor/` — typing aids, text objects, indentation, folding
   - `ui/` — colorschemes, statuslines, file trees, tab bars
   - `coding/` — LSP, completion, linting, formatting, snippets
   - `lang/` — language-specific tooling (Dart, Go, Markdown, etc.)
   - `tools/` — fuzzy finders, git, AI, terminal, debugging

2. **Create a Lua file** in the category directory. Here is a template:

```lua
-- lua/plugins/category/my-plugin.lua
--
-- Short description: what it does, what keymaps it adds.

return {
  'author/github-repo',
  event = 'VeryLazy',    -- Or 'InsertEnter', 'BufReadPre', etc.
  dependencies = {
    -- 'dep-author/dep-repo',
  },
  opts = {
    -- Options passed to require('plugin').setup(opts)
    setting = true,
  },
  -- For plugins that need manual setup instead of opts:
  -- config = function()
  --   require('plugin').setup({ ... })
  -- end,
}
```

3. **Import it in `lua/plugins/init.lua`** by adding a line to the appropriate section:

```lua
  -- [[ Category ]]
  ...
  require 'plugins.category.my-plugin',
  ...
```

4. **Restart Neovim.** Lazy.nvim will install the plugin on next launch.

## Disabling a Plugin

Comment out its `require` line in `lua/plugins/init.lua`:

```lua
  -- require 'plugins.tools.debug',   -- DISABLED
```

The file stays in place — uncomment to re-enable.

## Plugin Loading Hints

| Key | Purpose |
|-----|---------|
| `event` | Load on autocommand event (e.g. `VimEnter`, `InsertEnter`) |
| `cmd` | Load when a command is run (e.g. `LazyGit`) |
| `keys` | Load when a keymap is pressed (lazy-loads the plugin) |
| `ft` | Load when a filetype opens (e.g. `lua`, `go`) |
| `lazy` | `false` = load at startup, `true` = load on event/cmd/keys |
| `dependencies` | Other plugins that must be installed/loaded first |
