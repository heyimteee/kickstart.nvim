-- Auto-format on save via conform.nvim.
-- Format manually with <leader>f.
-- Stylua formats Lua; prettierd formats JS/TS/JSX/TSX/Vue/CSS/SCSS/JSON/HTML/Markdown;
-- gofumpt formats Go; php-cs-fixer formats PHP / Laravel.

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Skip format-on-save for languages with unpredictable formatters
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      vue = { 'prettierd' },
      css = { 'prettierd' },
      scss = { 'prettierd' },
      json = { 'prettierd' },
      html = { 'prettierd' },
      markdown = { 'prettierd' },
      go = { 'gofumpt' },
      php = { 'php_cs_fixer' },
    },
  },
}
