# Utilities

Shared helper functions used across the config. Import anywhere with `require('utils')`.

## When to Put Something Here

- A function used by 2+ plugin files (e.g. a `map()` wrapper)
- A helper that reduces boilerplate across config modules
- Any shared logic that doesn't belong to a single plugin

## How to Add a Utility

```lua
-- lua/utils/init.lua

local M = {}

-- Example: safe require that doesn't crash if module is missing
function M.safe_require(name)
  local ok, mod = pcall(require, name)
  if ok then return mod end
end

return M
```

Then use it anywhere:

```lua
local utils = require 'utils'
local mod = utils.safe_require 'some-optional-plugin'
```

Currently mostly empty — add helpers as patterns emerge across your config.
