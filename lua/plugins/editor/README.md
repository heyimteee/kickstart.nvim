# Editor Plugins

Typing experience: indentation, auto-pairing, surround, text-objects, comment highlighting.

## Active Plugins

| File | Plugin | Purpose |
|------|--------|---------|
| `indent.lua` | guess-indent.nvim + indent-blankline.nvim | Auto-detect indent width + visible indent guides |
| `autopairs.lua` | nvim-autopairs | Auto-close brackets, parens, quotes |
| `comments.lua` | todo-comments.nvim | Highlight TODO, FIXME, HACK in comments |
| `surround.lua` | mini.surround | Add/delete/replace surrounding chars (`sa`, `sd`, `sr`) |
| `textobjects.lua` | mini.ai | Enhanced text-objects (`va)`, `ci'`, `yinq`) |

## Adding an Editor Plugin

Create a file in this directory with the template:

```lua
-- lua/plugins/editor/my-plugin.lua

return {
  'author/repo',
  event = 'InsertEnter',
  opts = {
    -- your settings here
  },
}
```

Then import it in `lua/plugins/init.lua` under the `[[ Editor ]]` section:

```lua
  require 'plugins.editor.my-plugin',
```
