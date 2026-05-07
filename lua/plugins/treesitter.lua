-- Treesitter: syntax highlighting, indentation, and code folding via AST parsing.
-- Auto-installs missing parsers. Adding a language here ensures its parser is available.

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash', 'c', 'diff', 'javascript', 'php', 'typescript',
      'html', 'css', 'scss', 'json', 'python', 'xml',
      'lua', 'luadoc', 'tsx', 'vue', 'blade',
      'markdown', 'query', 'vim', 'vimdoc', 'go',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    -- CRITICAL: this registers the parsers, enables the highlight module,
    -- and processes ensure_installed so missing parsers are auto-installed.
    require('nvim-treesitter.config').setup(opts)

    -- Force-attach treesitter to every buffer for the languages we've installed.
    -- This prevents edge cases where a buffer doesn't get highlighting on first open.
    -- NOTE: patterns below must be actual Vim filetypes, not parser names.
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'bash', 'c', 'diff', 'javascript', 'javascriptreact',
        'php', 'typescript', 'typescriptreact',
        'html', 'css', 'scss', 'json', 'python', 'xml',
        'lua', 'luadoc', 'vue', 'blade',
        'markdown', 'query', 'vim', 'vimdoc', 'go',
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
