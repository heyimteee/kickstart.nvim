# Neovim Configuration

Personal Neovim setup — modular, maintainable, and built for the long haul. Originally derived from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), now fully reorganized.

## Prerequisites

- **Neovim** >= 0.10
- **git**, **make**, **unzip**, **ripgrep** (`rg`)
- **Node.js** >= 18 (for vtsls, volar, eslint, emmet, tailwindcss, prettierd LSPs/formatters)
- A **Nerd Font** (optional, but icons will be broken without one)

## Quick Start

```bash
# The first time you open Neovim, lazy.nvim will clone itself, then install all plugins.
# Mason will auto-install LSP servers and formatters.
nvim
```

Run `:checkhealth personal-config` to verify your system is ready.
Run `:Mason` to see installed/available LSP servers and tools.

## What's Inside

| Category | What it does |
|----------|-------------|
| **Editor** | Indentation, autopairs, surround, text-objects, comment highlighting |
| **UI** | TokyoNight colorscheme, neo-tree sidebar, mini.statusline, which-key hints |
| **Coding** | LSP (ts, vue, emmet, tailwind, eslint, css, lua, go), blink.cmp autocompletion, conform.nvim formatting (prettierd, gofumpt, stylua), markdown linting |
| **Languages** | Vue.js, React/Next.js (TSX), Dart/Flutter, Go, Lua, Markdown, TypeScript |
| **Tools** | Telescope, gitsigns, LazyGit, GitHub Copilot, DAP debugging (disabled) |
| **Syntax** | Treesitter with 25+ language parsers (vue, tsx, jsx, scss, etc.) |

## Directory Map

```
~/.config/nvim/
├── init.lua                ← Entry point (bootstrap → config → plugins)
├── lua/
│   ├── config/             ← Core settings (not plugins)
│   │   ├── lazy.lua        ← lazy.nvim installer
│   │   ├── options.lua     ← vim.o / vim.opt settings
│   │   ├── keymaps.lua     ← Global keymaps
│   │   └── autocmds.lua    ← Global autocommands
│   ├── plugins/            ← ALL plugin specs (one file per plugin)
│   │   ├── editor/         ← Editing enhancements
│   │   ├── ui/             ← Visual / appearance
│   │   ├── coding/         ← LSP, completion, formatting
│   │   ├── lang/           ← Language-specific plugins
│   │   └── tools/          ← Utility plugins
│   └── utils/              ← Shared helper functions
├── ARCHITECTURE.md         ← Design decisions and conventions
└── docs/                   ← Archived reference material
```

See [ARCHITECTURE.md](./ARCHITECTURE.md) for the full design rationale.

## Keymaps at a Glance

| Key | Action |
|-----|--------|
| `<leader>pv` | Open file explorer |
| `<leader>gg` | Open LazyGit |
| `<leader>f` | Format buffer |
| `<leader>q` | Diagnostic quickfix |
| `<leader>th` | Toggle inlay hints |
| `<leader>s*` | Telescope search (sf=files, sg=grep, sh=help, etc.) |
| `<leader>F*` | Flutter commands |
| `<leader>T*` | Go struct tags (visual mode) |
| `<leader>h*` | Git hunk actions |
| `\` | Toggle NeoTree sidebar |
| `<C-hjkl>` | Navigate windows |

Press `<leader>` and wait — which-key will show you all available mappings.

## Adding a Plugin

1. Create a file in the appropriate `lua/plugins/<category>/` directory (see README in each)
2. Add `require 'plugins.<category>.<file>'` to `lua/plugins/init.lua`

## Updating

```vim
:Lazy update    " Update all plugins
:Lazy check     " List available updates
```
