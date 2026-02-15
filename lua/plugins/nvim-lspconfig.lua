return function()
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
      local opts = { buffer = ev.buf }
      -- Press `K` in normal mode to show LSP over for type info
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    end,
  })

  local on_attach = function(client, bufnr)
    -- format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = function() vim.lsp.buf.format({ async = false }) end
      })
    end
  end

  vim.lsp.config('biome', {
    cmd = { "biome", "lsp-proxy", "--config-path=" .. vim.fn.expand("~/.vim") },
    on_attach = on_attach,
  })

  vim.lsp.config('ts_ls', {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
  })

  vim.lsp.config('gopls', {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
  })

  vim.lsp.config('ccls', {
    init_options = {
      cache = {
        directory = ".ccls-cache";
      };
    }
  })

  -- ruby
  vim.lsp.config('rubocop', {
    cmd = { "bundle", "exec", "rubocop", "--lsp" }
  })
  vim.lsp.config('ruby_lsp', {
    cmd = { "bundle", "exec", "ruby-lsp" }
  })

  -- python
  vim.lsp.config('pyright', {})
  vim.lsp.config('ruff', {
    on_attach = on_attach,
  })
end
