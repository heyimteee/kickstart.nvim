-- PHP / Laravel development support.
-- intelephense LSP handles autocomplete, diagnostics, go-to-definition, and
-- Laravel facade/model support (requires barryvdh/laravel-ide-helper).
-- php-cs-fixer formats on save (see plugins/coding/formatting.lua).
-- phpstan provides static analysis linting (see plugins/coding/linting.lua).
--
-- Recommended Laravel workflow:
--   1. composer require --dev barryvdh/laravel-ide-helper
--   2. php artisan ide-helper:generate      -- facades
--   3. php artisan ide-helper:models -R     -- models
--   4. php artisan ide-helper:meta          -- container / mixins
-- This generates _ide_helper.php files that intelephense reads for rich
-- Laravel auto-completion.

-- Detect .blade.php files as blade filetype so treesitter and LSP attach correctly.
vim.filetype.add {
  extension = {
    ['blade.php'] = 'blade',
  },
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
}

-- PHP-specific editor settings.
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'php', 'blade' },
  callback = function()
    -- 4-space indentation matches Laravel / PSR-12 standard.
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})

return {}
