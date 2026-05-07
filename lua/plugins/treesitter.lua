-- Treesitter: syntax highlighting, indentation, and code folding via AST parsing.
-- Auto-installs missing parsers. Adding a language here ensures its parser is available.

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash', 'zsh', 'c', 'diff', 'javascript', 'php', 'typescript',
      'html', 'html_tags', 'css', 'scss', 'json', 'python', 'xml',
      'lua', 'luadoc', 'tsx', 'jsx', 'vue',
      'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'go',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function()
    -- Force-attach treesitter to every buffer for the languages we've installed.
    -- This prevents edge cases where a buffer doesn't get highlighting on first open.
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'bash', 'zsh', 'c', 'diff', 'javascript', 'php', 'typescript',
        'html', 'html_tags', 'css', 'scss', 'json', 'python', 'xml',
        'lua', 'luadoc', 'tsx', 'jsx', 'vue',
        'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'go',
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
