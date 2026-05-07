# Architecture

## Design Principles

1. **One file, one responsibility** — Every `.lua` file does exactly one thing. Config files hold settings, plugin files hold specs, init files aggregate.
2. **Plugins by category** — `editor/`, `ui/`, `coding/`, `lang/`, `tools/` — drop a new plugin into the folder that matches its purpose.
3. **No inline config** — No plugin is configured inside `init.lua`. Everything lives in its own dedicated file.
4. **Aggregator pattern** — Category directories and `lua/plugins/init.lua` collect plugin specs into a flat array that lazy.nvim consumes.
5. **Disabled ≠ deleted** — Plugins you don't use stay in the tree but are commented out in the aggregator, so you can toggle them on with one line.

## How Lazy Loading Works

```
init.lua
  ├─ require('config.lazy')        → Clones lazy.nvim, prepends to rtp
  ├─ require('config')             → options.lua + keymaps.lua + autocmds.lua
  └─ lazy.setup(require('plugins'), opts)
       └─ plugins/init.lua         → Aggregates all plugin specs
            ├─ plugins/editor/*    → { 'plugin/name', opts = {...} }
            ├─ plugins/ui/*
            ├─ plugins/coding/*
            ├─ plugins/lang/*
            └─ plugins/tools/*
```

Each plugin file returns a **lazy.nvim spec table** (a plain Lua table with keys like `opts`, `config`, `event`, `keys`, `dependencies`, etc.). Lazy.nvim reads these specs and:
- Downloads the plugin from GitHub if not cached
- Loads it on the specified `event` or `cmd`
- Merges `opts` into the plugin's `setup()` call
- Runs `config` if you need custom initialization

## File Conventions

### Plugin File Template
```lua
-- lua/plugins/<category>/<name>.lua
--
-- Brief description of what this plugin does and what keymaps it adds.

return {
  'author/repo',             -- GitHub shorthand
  event = 'VimEnter',        -- When to load (or use 'keys', 'cmd', 'ft', etc.)
  dependencies = { ... },    -- Other plugins this one needs
  opts = { ... },            -- Passed to require('plugin').setup(opts)
  config = function()        -- For manual setup (use opts {} if possible)
    require('plugin').setup { ... }
  end,
}
```

### Aggregator (plugins/init.lua)

```lua
return {
  -- Active plugins
  require 'plugins.editor.indent',

  -- Disabled plugins — uncomment to enable
  -- require 'plugins.coding.linting',
}
```

## Design Decision Log

### Why not `lazy.nvim`'s `import` feature?

The `{ import = 'path' }` syntax works but hides which plugins are loaded — you have to open each file to find out. Explicit `require` calls in a single aggregator give you a complete inventory in one glance.

### Why split mini.nvim into separate files?

`mini.nvim` is a collection of independent modules (mini.ai, mini.surround, mini.statusline). Each serves a different purpose and belongs in a different category. Grouping them by function makes the config easier to reason about.

### Why TSX highlights live in colorscheme.lua?

The TSX highlight overrides depend on TokyoNight being loaded and colors set. Putting them in the colorscheme config guarantees they run after the theme is applied.

### Why ESLint diagnostics come from the LSP, not nvim-lint?

The `eslint` LSP server provides richer diagnostics (code actions, quickfixes, per-line ignore) than the standalone linting pipeline. nvim-lint is reserved for filetypes without an LSP-based linter (e.g. Markdown via `markdownlint`).

### Why prettierd instead of prettier?

`prettierd` runs as a background daemon, making format-on-save nearly instant compared to spawning a new Node.js process for every save. Mason auto-installs it.

### Why gofumpt for Go?

`gofumpt` is a strict superset of `gofmt` — it produces more deterministic formatting (e.g. grouping imports, aligning fields). It's the standard choice in modern Go projects.

### Why mason-lspconfig only does wiring, not installation?

`mason-lspconfig` builds its server→package mapping dynamically from the Mason registry. Not all lspconfig servers have registry metadata (e.g. `volar` → `vue-language-server` isn't always mapped). So `ensure_installed` via mason-lspconfig is unreliable. Instead, `mason-tool-installer` handles ALL auto-installation using exact Mason package names — no translation step that can break. `mason-lspconfig` is used purely for its handler that bridges lspconfig ↔ Mason.

## When You Want to Change Something

| You want to... | Edit this file |
|---------------|---------------|
| Change a vim option | `lua/config/options.lua` |
| Add a global keymap | `lua/config/keymaps.lua` |
| Add an autocommand | `lua/config/autocmds.lua` |
| Install a new plugin | Create file in `lua/plugins/<category>/`, import in `lua/plugins/init.lua` |
| Change a plugin's settings | Edit its file in `lua/plugins/<category>/` |
| Disable a plugin | Comment out its `require` in `lua/plugins/init.lua` |
| Change the colorscheme | `lua/plugins/ui/colorscheme.lua` |
| Change LSP servers | `lua/plugins/coding/lsp.lua` (the `servers` table) |
