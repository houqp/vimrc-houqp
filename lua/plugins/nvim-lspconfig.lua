return function()
  local lspconfig = require("lspconfig")

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

  lspconfig.tsserver.setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
  }

  lspconfig.gopls.setup({
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

  lspconfig.ccls.setup {
    init_options = {
      cache = {
        directory = ".ccls-cache";
      };
    }
  }

  -- ruby
  lspconfig.rubocop.setup{
    cmd = { "bundle", "exec", "rubocop", "--lsp" }
  }
  lspconfig.ruby_ls.setup{
    cmd = { "bundle", "exec", "ruby-lsp" }
  }

  -- python
  lspconfig.pyright.setup {}
  lspconfig.ruff_lsp.setup{}
end
