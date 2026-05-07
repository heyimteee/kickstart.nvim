-- Treesitter: syntax highlighting, indentation, and code folding via AST parsing.
--
-- NOTE: nvim-treesitter was fully rewritten. The old `configs.setup()` API is gone.
-- Highlight is enabled via `vim.treesitter.start()`, indent via `indentexpr`.
-- See: https://github.com/nvim-treesitter/nvim-treesitter/blob/main/README.md

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false, -- The README says this plugin does not support lazy-loading.
  build = ':TSUpdate',
  config = function()
    -- Parsers we want available. Missing ones are auto-installed in the background.
    local desired = {
      'bash', 'c', 'diff', 'javascript', 'php', 'typescript',
      'html', 'css', 'scss', 'json', 'python', 'xml',
      'lua', 'luadoc', 'tsx', 'vue', 'blade',
      'markdown', 'query', 'vim', 'vimdoc', 'go',
    }

    local installed = require('nvim-treesitter.config').get_installed('parsers')
    local installed_set = {}
    for _, p in ipairs(installed) do
      installed_set[p] = true
    end

    local to_install = {}
    for _, p in ipairs(desired) do
      if not installed_set[p] then
        table.insert(to_install, p)
      end
    end

    if #to_install > 0 then
      require('nvim-treesitter').install(to_install)
    end

    -- Enable treesitter highlighting + indentation for supported filetypes.
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'bash', 'c', 'diff', 'javascript', 'javascriptreact',
        'php', 'typescript', 'typescriptreact',
        'html', 'css', 'scss', 'json', 'python', 'xml',
        'lua', 'luadoc', 'vue', 'blade',
        'markdown', 'query', 'vim', 'vimdoc', 'go',
      },
      callback = function(args)
        -- Syntax highlighting
        vim.treesitter.start()
        -- Smart indentation (experimental but usually better than vim built-in)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
