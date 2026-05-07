-- Linting via nvim-lint.
-- ESLint diagnostics are handled by the ESLint LSP server (see lsp.lua) for
-- JS/TS/JSX/TSX/Vue — no need to duplicate here.
-- PHP static analysis is handled by phpstan (see lsp.lua for intelephense).
-- This handles linting for filetypes without an LSP-based linter.

return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        php = { 'phpstan' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('user-lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
