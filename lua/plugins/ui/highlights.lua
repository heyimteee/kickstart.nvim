-- JSX / TSX highlight overrides for Ayu Dark.
-- These only activate in javascriptreact / typescriptreact buffers so the
-- overrides do not leak into other filetypes.
--
-- Capture names match nvim-treesitter's JSX queries exactly:
--   @tag.builtin      → built-in HTML tags: <div>, <span>, <main>
--   @tag              → custom components: <Hero />, <GetCertified />
--   @tag.attribute    → props: className=, onClick=
--   @tag.delimiter    → <, >, </, />

local M = {}

-- Ayu Dark palette — colours chosen to avoid the orange overload caused by
-- Ayu's default keyword colour (#FF8F40) dominating JSX files.
local ayu = {
  cyan      = '#39BAE6', -- tag       (HTML elements)
  purple    = '#D2A6FF', -- constant  (custom components — very distinct)
  teal      = '#95E6CB', -- regexp    (attributes — cool, readable)
  grey      = '#636A72', -- comment   (delimiters — recede visually)
}

local JSX_FTS = { javascriptreact = true, typescriptreact = true }

---Apply JSX-specific highlight groups.
local function apply_jsx_highlights()
  -- Built-in HTML tags (lowercase): <div>, <span>, <main>
  vim.api.nvim_set_hl(0, '@tag.builtin', { fg = ayu.cyan })

  -- Custom React components (PascalCase): <Hero />, <GetCertified />, <About />
  vim.api.nvim_set_hl(0, '@tag', { fg = ayu.purple })

  -- Tag attributes: className=, onClick=, disabled
  vim.api.nvim_set_hl(0, '@tag.attribute', { fg = ayu.teal })

  -- Delimiters: <, >, </, />
  vim.api.nvim_set_hl(0, '@tag.delimiter', { fg = ayu.grey })
end

---Check if the current colorscheme is an Ayu variant.
local function is_ayu()
  local name = vim.g.colors_name or ''
  return name:match('^ayu') ~= nil
end

---Check if the current buffer is JSX/TSX.
local function is_jsx_buffer()
  return JSX_FTS[vim.bo.filetype] == true
end

local group = vim.api.nvim_create_augroup('user-ayu-jsx-highlights', { clear = true })

-- Apply overrides whenever entering a JSX/TSX buffer.
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = { 'javascriptreact', 'typescriptreact' },
  callback = function()
    if is_ayu() then
      apply_jsx_highlights()
    end
  end,
})

-- Re-apply after colorscheme changes, but only if the active buffer is JSX/TSX.
vim.api.nvim_create_autocmd('ColorScheme', {
  group = group,
  callback = function()
    if is_ayu() and is_jsx_buffer() then
      apply_jsx_highlights()
    end
  end,
})

-- Apply immediately at startup if Ayu is already active and the current
-- buffer happens to be JSX/TSX (e.g. when reopening a session).
if is_ayu() and is_jsx_buffer() then
  apply_jsx_highlights()
end

return M
