-- LSP (Language Server Protocol) setup with Mason for automatic server installation.
--
-- Servers configured: vtsls (TS/JS), volar (Vue), emmet_ls (HTML/CSS/JSX abbreviations),
--   tailwindcss, eslint, cssls (CSS/SCSS), lua_ls, gopls (Go).
-- LSP-attached keymaps are all under the `gr` prefix (goto references).

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} }, -- LSP progress spinner
    'saghen/blink.cmp', -- Passes extra capabilities to LSP servers
  },
  config = function()
    -- LSP-attached keymaps are created once per buffer when a language server starts.
    -- All mappings use the `gr` prefix ("goto reference") and delegate to Telescope
    -- for list-based navigation (references, implementations, etc.).
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
        map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
        map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
        map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

        -- Compatibility shim between Neovim 0.10 (stable) and 0.11 (nightly)
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        -- Highlight references under cursor after a short idle
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_group = vim.api.nvim_create_augroup('user-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_group,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_group,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('user-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'user-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- Toggle inlay hints (type annotations displayed inline)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- Global diagnostic appearance — icons require a Nerd Font
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          return diagnostic.message
        end,
      },
    }

    -- Merge blink.cmp capabilities so LSP servers know about our completion setup
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- LSP servers to install and configure.
    -- Add or remove entries here — Mason installs them and lspconfig wires them up.
    local servers = {
      -- TypeScript / JavaScript — React, Next.js, Node.js
      vtsls = {
        on_attach = function(client, bufnr)
          client.server_capabilities.semanticTokensProvider = nil
        end,
        settings = {
          typescript = {
            updateImportsOnRename = 'always',
            suggest = { completeFunctionCalls = true },
            preferences = {
              includeCompletionsWithImport = true, -- Auto-import when accepting completion
            },
          },
          javascript = {
            updateImportsOnRename = 'always',
            suggest = { completeFunctionCalls = true },
            preferences = {
              includeCompletionsWithImport = true,
            },
          },
        },
      },

      -- Vue 3 Single File Components
      volar = {
        filetypes = { 'vue' },
      },

      -- Emmet completions for HTML, CSS, SCSS, JSX (React), Vue
      emmet_ls = {
        filetypes = { 'css', 'scss', 'html', 'javascriptreact', 'typescriptreact', 'vue' },
      },

      -- Tailwind CSS IntelliSense (class completion, hover preview)
      tailwindcss = {},

      -- ESLint diagnostics (errors/warnings inline from your eslint config)
      eslint = {
        settings = {
          workingDirectory = { mode = 'auto' },
        },
      },

      -- CSS/SCSS autocomplete and validation
      cssls = {},

      -- Lua (Neovim config, plugins)
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },

      -- Go (gopls — the official Go language server)
      gopls = {},
    }

    -- Wire up lspconfig with handlers (mason-lspconfig bridges lspconfig → Mason).
    -- automatic_installation = false because we install via mason-tool-installer below.
    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    -- Auto-install LSP servers + formatters via mason-tool-installer.
    -- IMPORTANT: these are Mason package names, NOT lspconfig names.
    -- e.g. 'vue-language-server' (not 'volar'), 'eslint-lsp' (not 'eslint').
    require('mason-tool-installer').setup {
      ensure_installed = {
        -- LSP servers
        'vue-language-server', -- Volar (Vue)
        'vtsls', -- TypeScript/JavaScript
        'emmet-language-server', -- Emmet abbreviations
        'tailwindcss-language-server', -- Tailwind CSS IntelliSense
        'eslint-lsp', -- ESLint diagnostics
        'css-lsp', -- CSS / SCSS
        'lua-language-server', -- Lua
        'gopls', -- Go
        -- Formatters
        'stylua', -- Lua
        'prettierd', -- JS/TS/Vue/CSS/JSON/HTML/MD
        'gofumpt', -- Go
      },
    }
  end,
}
